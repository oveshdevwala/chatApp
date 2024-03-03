import 'package:mangochatapp/features/user/domain/repository/user_repository.dart';

class SignOutUseCase {
  final UserRepository repository;

  SignOutUseCase(this.repository);

  Future<void> call() {
    return repository.SignOut();
  }
}
