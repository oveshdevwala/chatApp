import 'package:mangochatapp/features/user/domain/repository/user_repository.dart';

class GetCurrentUserUseCase {
  final UserRepository repository;

  GetCurrentUserUseCase(this.repository);
 Future<String> call() {
    return repository.getCurrentUserID();
  }
}
