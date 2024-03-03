import 'package:mangochatapp/features/user/domain/repository/user_repository.dart';

class IsSignInUsecase {
  final UserRepository repository;

  IsSignInUsecase(this.repository);

 Future<bool> call() {
    return repository.isSignIn();
  }
}
