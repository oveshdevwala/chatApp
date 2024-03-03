import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mangochatapp/features/app/const/firebase_collection_const.dart';
import 'package:mangochatapp/features/user/data/models/user_model.dart';
import 'package:mangochatapp/features/user/data/remote/user_remote_data_source.dart';
import 'package:mangochatapp/features/user/domain/entities/contact_entity.dart';
import 'package:mangochatapp/features/user/domain/entities/user_entity.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore fireStore;

  UserRemoteDataSourceImpl({required this.auth, required this.fireStore});
  String _verifyId = '';
  @override
  Future<void> createUser(UserEntity user) async {
    final userCollation = fireStore.collection(FirebaseCollationConst.user);
    var uId = await getCurrentUserID();
    final newUser = UserModel(
            name: user.name!,
            id: uId,
            mobileNumber: user.mobileNumber,
            accountCreatedDate: user.accountCreatedDate,
            email: user.email,
            isOnline: user.isOnline,
            lastOnline: user.lastOnline,
            notification: user.notification,
            profilePic: user.profilePic,
            profilePicStatus: user.profilePicStatus,
            pushToken: user.pushToken,
            status: user.status,
            whoCanMsgMe: user.whoCanMsgMe)
        .toDocument();
    try {
      userCollation.doc(uId).get().then((value) {
        if (!value.exists) {
          userCollation.doc().set(newUser);
        } else {
          userCollation.doc().update(newUser);
        }
      });
    } catch (e) {
      throw Exception('Error $e');
    }
  }

  @override
  Stream<List<UserEntity>> getAllUser() {
    final userCollation = fireStore.collection(FirebaseCollationConst.user);

    return userCollation.snapshots().map(
        (event) => event.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  @override
  Future<String> getCurrentUserID() async => auth.currentUser!.uid;

  @override
  Future<List<ContactEntity>> getDevicePhoneNumber() async {
    List<ContactEntity> contactList = [];
    final getContactData = await ContactsService.getContacts();
    for (var myContact in getContactData) {
      for (var phoneData in myContact.phones!) {
        contactList.add(ContactEntity(
            phoneNumber: phoneData.value!,
            label: myContact.displayName!,
            userProfile: myContact.avatar!));
      }
    }
    return contactList;
  }

  @override
  Stream<List<UserEntity>> getSignUser(String uID) {
    var userCollection = fireStore
        .collection(FirebaseCollationConst.user)
        .where('id', isEqualTo: uID);
    return userCollection.snapshots().map((event) {
      return event.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    });
  }

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;
  @override
  Future<void> SignOut() async => auth.signOut();

  @override
  Future<void> updateUser(UserEntity user) async {
    var userCollection = fireStore.collection(FirebaseCollationConst.user);

    Map<String, dynamic> updateUser = {};
    if (user.name != null || user.name != '') updateUser['name'] = user.name;
    if (user.profilePic != null || user.profilePic != '')
      updateUser['profilePic'] = user.profilePic;
    if (user.isOnline != null || user.isOnline != '')
      updateUser['isOnline'] = user.isOnline;

    userCollection.doc(user.id).update(updateUser);
  }

  @override
  Future<void> signInWithPhoneNumber(String smsPinCode) async {
    try {
      final AuthCredential authCredential = PhoneAuthProvider.credential(
          verificationId: _verifyId, smsCode: smsPinCode);
     await auth.signInWithCredential(authCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-phone-number') {
        print('The provided phone number is not valid.');
      } else if (e.code == 'quota-exceeded') {
        print('SMS Quota Exceeded');
      }
    } catch (e) {
      print('Auth Error : $e');
    }
  }

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    phoneAuthCredential(PhoneAuthCredential auth) {
      print('Phone verify Credential : ${auth.token} ${auth.token}');
    }

    verificationFailed(FirebaseAuthException firebaseAuthException) {
      print(
          'Phone verificationFailed : ${firebaseAuthException.message} ${firebaseAuthException.code}');
    }

    codeSent(String verifyId, int? forceResendingToken) {
      print('Phone codeSent : ${verifyId} ${forceResendingToken}');
      _verifyId = verifyId;
    }

    codeAutoRetrievalTimeout(String verifyId) {
      _verifyId = verifyId;
      print('Phone codeAutoRetrievalTimeout: ${verifyId} ');
    }

    await auth.verifyPhoneNumber(
        verificationCompleted: phoneAuthCredential,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }
}
