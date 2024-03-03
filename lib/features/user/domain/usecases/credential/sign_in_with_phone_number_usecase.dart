import 'package:mangochatapp/features/user/domain/repository/user_repository.dart';

class SignInWithPhoneNumberUseCase {
  final UserRepository repository;

  SignInWithPhoneNumberUseCase(this.repository);
  Future<void>  call(String smsPinCode) {
    return repository.signInWithPhoneNumber(smsPinCode);
  }
}
