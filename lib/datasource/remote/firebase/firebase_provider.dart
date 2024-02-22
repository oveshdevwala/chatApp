import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/app_routes/app_routes.dart';
import 'package:mangochatapp/constrains/variables.dart';
import 'package:mangochatapp/datasource/remote/firebase_notification_services/push_notification_services.dart';
import 'package:mangochatapp/feature/models/message_model.dart';
import 'package:mangochatapp/feature/models/user_model.dart';
import 'package:mangochatapp/feature/screens/onboarding/otp_screen/otp_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class FirebaseProvider {
  static final fireStore = FirebaseFirestore.instance;
  static final auth = FirebaseAuth.instance;
  static final storage = FirebaseStorage.instance.ref();
  static final phoneAuth = PhoneAuthProvider;

  static final userCollection = 'users';
  static final chatCollation = 'chats';
  static final messageCollation = 'messages';
  static String userId = auth.currentUser!.uid;
  // createUser({
  //   required UserModel mUserModel,
  //   required String pass,
  // }) async {
  //   try {
  //     var credentials = await auth.createUserWithEmailAndPassword(
  //       email: mUserModel.email.toString(),
  //       password: pass,
  //     );
  //     var uId = credentials.user!.uid;
  //     if (credentials.user != null) {
  //       fireStore
  //           .collection(userCollection)
  //           .doc(uId)
  //           .set(mUserModel.toDoc())
  //           .then((value) async {
  //         var prefs = await SharedPreferences.getInstance();
  //         prefs.setString(LoginPrefKey, uId);
  //       }).onError((e, stackTrace) {
  //         print(e.toString());
  //         throw Exception("Error : $e");
  //       });
  //       ;
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     print(e.toString());
  //     throw Exception("Error : $e");
  //   }
  // }

  // signInuser({required String email, required String password}) async {
  //   try {
  //     await auth
  //         .signInWithEmailAndPassword(email: email, password: password)
  //         .then((value) async {
  //       var prefs = await SharedPreferences.getInstance();
  //       prefs.setString(LoginPrefKey, value.user!.uid);
  //     }).onError((e, stackTrace) {
  //       print('login Error${e.toString()}');
  //       throw Exception("Error : $e");
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     print(e.toString());
  //     throw Exception("Error : $e");
  //   }
  // }

  verifyPhoneNumber(
      {required String phoneNumber, required BuildContext context}) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
        verificationFailed: (FirebaseAuthException e) {
          throw Exception(e.message);
        },
        codeSent: (String verificationId, int? forceResendingToken) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => OTPVerifyScreen(
                  verifyId: verificationId,
                  phoneNumber: phoneNumber,
                ),
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
          var mUserModel = await UserModel(
              name: userName,
              id: uId,
              isOnline: true,
              notification: true,
              lastOnline: int.parse(currentTime),
              pushToken: null,
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
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => Scaffold(),
        //     ));
        Navigator.pushReplacementNamed(context, AppRoutes.landingScreen);
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

  static Stream<QuerySnapshot<Map<String, dynamic>>> getHomeScreenUsers() {
    try {
      var users = fireStore.collection(userCollection).snapshots();
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

  static sendTextMessage(
      {required String message, required UserModel userModel}) async {
    var currentTime = DateTime.now().millisecondsSinceEpoch;
    var chatId = getChatId(fromId: userId, toId: userModel.id!);
    var messageModel = MessageModel(
      messsage: message,
      sendAt: currentTime,
      messageId: currentTime.toString(),
      fromId: userId,
      toId: userModel.id!,
    );

    fireStore
        .collection(chatCollation)
        .doc(chatId)
        .collection(messageCollation)
        .doc(currentTime.toString())
        .set(messageModel.toDoc())
        .then((value) {
      FireNotification.sendPushNotification(user: userModel, message: message);
      fireStore.collection(chatCollation).doc(chatId).set({
        'ids': [userModel.id, userId]
      });
    });
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUserProfileData(
      userId) {
    return fireStore.collection(userCollection).doc(userId).snapshots();
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

// Future<List<UserModel>>
  // static Future<List<UserModel>> getAllMesageTest(
  //     {String? toId, String? userID}) async {
  //   List<UserModel> chatedUserss = [];

  //   await fireStore
  //       .collection(userCollection)
  //       .snapshots()
  //       .forEach((event) async {
  //     for (var user in event.docs) {
  //       var userModel = UserModel.fromDoc(user.data());
  //       var chatId = getChatId(fromId: userModel.id!, toId: userId);
  //       await fireStore
  //           .collection(chatCollation)
  //           .doc(chatId)
  //           .collection(messageCollation)
  //           .doc()
  //           .snapshots()
  //           .forEach((element) async {
  //         var msgModel = MessageModel.fromDoc(element.data()!);

  //         var userget = await getUserById(msgModel.toId);
  //         var userGetModel = UserModel.fromDoc(userget.data()!);
  //         chatedUserss.add(userGetModel);
  //       });
  //     }
  //   });

  //   return await chatedUserss;
  // }

  static updateNoticiationStatus({required bool value, required String toId}) {
    fireStore
        .collection(userCollection)
        .doc(toId)
        .update({'notification': value});
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

  static UpdateUserOnline() {
    fireStore.collection(userCollection).doc(userId).update({'isOnline': true});
  }

  static updatePushToken() {
    fireStore
        .collection(userCollection)
        .doc(userId)
        .update({'pushToken': FireNotification.fCMToken});
  }

  static UpdateUserOffline() async {
    var currentTime = DateTime.now().millisecondsSinceEpoch;
    fireStore.collection(userCollection).doc(userId).update({
      'lastOnline': currentTime,
      'isOnline': false,
    });
  }

  static getLastMessage({required String toId}) {
    var chatId = getChatId(fromId: userId, toId: toId);
    return fireStore
        .collection(chatCollation)
        .doc(chatId)
        .collection(messageCollation)
        .orderBy('sendAt', descending: true)
        .limit(1)
        .snapshots();
  }

  static nowUpdateLastMessage(
      {required String lastMessage, required String toId}) {
    fireStore
        .collection(userCollection)
        .doc(toId)
        .update({'lastMessage': lastMessage});
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getUnreadCount(
      {required String toId}) {
    var chatId = getChatId(fromId: userId, toId: toId);
    return fireStore
        .collection(chatCollation)
        .doc(chatId)
        .collection(messageCollation)
        .where('readAt', isNull: true)
        .where('fromId', isEqualTo: toId)
        .snapshots();
  }

  static uploadProfilePicture(
      {required File? profileFile, required BuildContext context}) {
    var bucket = storage
        .child('Users')
        .child('profile')
        .child('${userId}_profile_pic.jpg ');
    try {
      if (profileFile != null) {
        bucket.putFile(profileFile).then((value) async {
          String profileUrl = await value.ref.getDownloadURL();
          fireStore
              .collection(userCollection)
              .doc(userId)
              .update({'profilePic': profileUrl});
        });
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error : $e')));
    }
  }

  static UpdateProfileData({
    required String email,
    required String userName,
  }) {
    fireStore
        .collection(userCollection)
        .doc(userId)
        .update({'email': email, 'name': userName});
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> getUserById(
      String documentId) async {
    return FirebaseFirestore.instance
        .collection(userCollection)
        .doc(documentId)
        .get();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMesageTest2() {
    return fireStore
        .collection(userCollection)
        .where('id', isEqualTo: auth.currentUser!.uid)
        .snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getUserIds() {
    return fireStore.collection(chatCollation).snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getUserByFromIdAndToId(
      List<String> userIds) {
    if (userIds.isEmpty) {
      return Stream.empty();
    } else {
      return FirebaseFirestore.instance
          .collection(userCollection)
          .where(FieldPath.documentId, whereIn: userIds, isNotEqualTo: userId)
          .snapshots();
    }
  }

  static deleteChatCollation(String toId) async {
    var chatId = getChatId(fromId: userId, toId: toId);
    var mainDoc = fireStore.collection(chatCollation).doc(chatId);
    var subDoc = await mainDoc.collection(messageCollation).get();
    await mainDoc.delete().then((value) async {
      for (var docSnap in subDoc.docs) {
        await docSnap.reference.delete();
      }
    });
  }

  // static List<String> allChatedUserIds() {
  //   List<String> ChatedUserId = [];
  //   fireStore.collection(chatCollation).snapshots().listen((snapshot) async {
  //     for (var chats in await snapshot.docs) {
  //       var fromId = chats.data()['ids'][0];
  //       var toId = chats.data()['ids'][1];
  //       if (fromId == userId) {
  //         ChatedUserId.add(toId);
  //       } else if (toId == userId) {
  //         ChatedUserId.add(fromId);
  //       }
  //     }
  //   });
  //   return ChatedUserId;
  // }
}
