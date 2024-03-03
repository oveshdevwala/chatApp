import 'package:mangochatapp/features/user/data/remote/user_remote_data_source.dart';
import 'package:mangochatapp/features/user/domain/entities/contact_entity.dart';
import 'package:mangochatapp/features/user/domain/entities/user_entity.dart';
import 'package:mangochatapp/features/user/domain/repository/user_repository.dart';

class UserRepositoryImplements implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImplements(this.remoteDataSource);
  @override
  Future<void> SignOut() => remoteDataSource.SignOut();

  @override
  Future<void> createUser(UserEntity userM) =>
      remoteDataSource.createUser(userM);

  @override
  Stream<List<UserEntity>> getAllUser() => remoteDataSource.getAllUser();

  @override
  Future<String> getCurrentUserID() => remoteDataSource.getCurrentUserID();

  @override
  Future<List<ContactEntity>> getDevicePhoneNumber() =>
      remoteDataSource.getDevicePhoneNumber();

  @override
  Stream<List<UserEntity>> getSignUser(String uID) =>
      remoteDataSource.getSignUser(uID);
  @override
  Future<bool> isSignIn() => remoteDataSource.isSignIn();

  @override
  Future<void> signInWithPhoneNumber(String smsPinCode) =>
      remoteDataSource.signInWithPhoneNumber(smsPinCode);

  @override
  Future<void> updateUser(UserEntity userM) =>
      remoteDataSource.updateUser(userM);
  @override
  Future<void> verifyPhoneNumber(String phoneNumber) =>
      remoteDataSource.verifyPhoneNumber(phoneNumber);
}
