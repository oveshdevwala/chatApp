import 'package:mangochatapp/features/user/domain/repository/user_repository.dart';

class VerifyPhoneNumberUseCase {
  final UserRepository repo;

  VerifyPhoneNumberUseCase(this.repo);

  Future<void> call(String phoneNumber) async {
    return repo.verifyPhoneNumber(phoneNumber);
  }
}
