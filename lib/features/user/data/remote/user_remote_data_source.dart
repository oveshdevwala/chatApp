
import 'package:mangochatapp/features/user/domain/entities/contact_entity.dart';
import 'package:mangochatapp/features/user/domain/entities/user_entity.dart';

abstract class UserRemoteDataSource {
  //Credential
  Future<void> verifyPhoneNumber(String phoneNumber);
  Future<void> signInWithPhoneNumber(String smsPinCode);
  Future<bool> isSignIn();
  Future<void> SignOut();
  Future<String> getCurrentUserID();
  //User
  Future<void> createUser(UserEntity userM);
  Future<void> updateUser(UserEntity userM);
  Stream<List<UserEntity>> getAllUser();
  Stream<List<UserEntity>> getSignUser(String uID);
  Future<List<ContactEntity>> getDevicePhoneNumber();

}
