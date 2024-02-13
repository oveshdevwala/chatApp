import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/app_routes/app_routes.dart';
import 'package:mangochatapp/constrains/variables.dart';
import 'package:mangochatapp/feature/models/message_model.dart';
import 'package:mangochatapp/feature/models/user_model.dart';
import 'package:mangochatapp/feature/screens/onboarding/otp_screen/otp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseProvider {
  static final fireStore = FirebaseFirestore.instance;
  static final auth = FirebaseAuth.instance;
  static final phoneAuth = PhoneAuthProvider;

  static final userCollection = 'users';
  static final chatCollation = 'chats';
  static final messageCollation = 'messages';
  static String userId = auth.currentUser!.uid;
  createUser({
    required UserModel mUserModel,
    required String pass,
  }) async {
    try {
      var credentials = await auth.createUserWithEmailAndPassword(
        email: mUserModel.email.toString(),
        password: pass,
      );
      var uId = credentials.user!.uid;
      if (credentials.user != null) {
        fireStore
            .collection(userCollection)
            .doc(uId)
            .set(mUserModel.toDoc())
            .then((value) async {
          var prefs = await SharedPreferences.getInstance();
          prefs.setString(LoginPrefKey, uId);
        }).onError((e, stackTrace) {
          print(e.toString());
          throw Exception("Error : $e");
        });
        ;
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      throw Exception("Error : $e");
    }
  }

  signInuser({required String email, required String password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        var prefs = await SharedPreferences.getInstance();
        prefs.setString(LoginPrefKey, value.user!.uid);
      }).onError((e, stackTrace) {
        print('login Error${e.toString()}');
        throw Exception("Error : $e");
      });
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      throw Exception("Error : $e");
    }
  }

  verifyPhoneNumber(
      {required String phoneNumber, required BuildContext context}) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: "+91$phoneNumber",
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
        verificationFailed: (FirebaseAuthException e) {
          throw Exception(e);
        },
        codeSent: (String verificationId, int? forceResendingToken) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => OTPScreeen(verifyId: verificationId),
              ));
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error : $e')));
      throw Exception(e);
    }
  }

  checkCrediential(
      {required String verifyId,
      required String otp,
      required String number,
      required String userName,
      required String emailContoller,
      required BuildContext context}) async {
    var credential = PhoneAuthProvider.credential(
      verificationId: verifyId,
      smsCode: otp,
    );
    try {
      await auth.signInWithCredential(credential).then((value) async {
        var uId = value.user!.uid;

        if (value.additionalUserInfo!.isNewUser) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Succesfully')));

          var currentTime = DateTime.now().millisecondsSinceEpoch.toString();
          var mUserModel = UserModel(
              name: userName,
              id: uId,
              email: emailContoller,
              mobileNumber: number,
              accountCreatedDate: currentTime);
          await fireStore
              .collection(userCollection)
              .doc(uId)
              .set(mUserModel.toDoc())
              .then((value) async {});
        }
        var prefs = await SharedPreferences.getInstance();
        prefs.setString(LoginPrefKey, uId);
        Navigator.pushReplacementNamed(context, AppRoutes.appHomeScreen);
      });
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error : $e')));
      throw Exception(e);
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAllUser() {
    try {
      var users = fireStore
          .collection(userCollection)
          .get()
          .onError((error, stackTrace) {
        throw Exception('Error : $error');
      });
      return users;
    } on FirebaseAuthException catch (e) {
      throw Exception('Error : $e');
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getHomeScreenUsers() {
    try {
      var users = fireStore
          .collection(userCollection)
          .get()
          .onError((error, stackTrace) {
        throw Exception('Error : $error');
      });
      ;
      return users;
    } on FirebaseAuthException catch (e) {
      throw Exception('Error : $e');
    }
  }

  static String getChatId({required String fromId, required String toId}) {
    if (fromId.hashCode <= toId.hashCode) {
      return "${fromId}_${toId}";
    } else {
      return "${toId}_${fromId}";
    }
  }

  static sendTextMessage({required String message, required String toId}) {
    var currentTime = DateTime.now().millisecondsSinceEpoch;
    var chatId = getChatId(fromId: userId, toId: toId);

    print('Current User Id : $userId');
    print(" Chat Room Id :$chatId");
    var messageModel = MessageModel(
      messsage: message,
      sendAt: currentTime,
      messageId: currentTime.toString(),
      fromId: userId,
      toId: toId,
    );
    print(messageModel.toDoc());
    fireStore
        .collection(chatCollation)
        .doc(chatId)
        .collection(messageCollation)
        .doc(currentTime.toString())
        .set(messageModel.toDoc());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMesage(
      {required String toId, required String userID}) {
    var chatId = getChatId(fromId: userID, toId: toId);
    return fireStore
        .collection(chatCollation)
        .doc(chatId)
        .collection(messageCollation)
        .orderBy('sendAt', descending: true)
        .snapshots();
  }

  static updateReadMessage(
      {required String msgId,
      required String userId,
      required String toId}) async {
    var currentTime = DateTime.now().millisecondsSinceEpoch;
    var chatId = getChatId(fromId: userId, toId: toId);
    await fireStore
        .collection(chatCollation)
        .doc(chatId)
        .collection(messageCollation)
        .doc(msgId)
        .update({"readAt": currentTime});
  }

  static UpdateUserOnline() async {
    await fireStore
        .collection(userCollection)
        .doc(userId)
        .update({'isOnline': true});
  }

  static UpdateUserOffline() async {
    var currentTime = DateTime.now().millisecondsSinceEpoch;
    var userField = fireStore.collection(userCollection).doc(userId);
    userField.update({'lastOnline': currentTime});
    userField.update({'isOnline': false});
  }

  static updateLastMessage(
      {required String toId, required String message}) async {
    await fireStore
        .collection(userCollection)
        .doc(toId)
        .update({'lastMessage': message});
  }

  static String getUnreadCount({required String toId}) {
    var chatId = getChatId(fromId: userId, toId: toId);
 return   fireStore
        .collection(chatCollation)
        .doc(chatId)
        .collection(messageCollation)
        .where('readAt', whereIn: null).count().toString();
  }
}
