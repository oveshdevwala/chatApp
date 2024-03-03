import 'package:mangochatapp/features/user/domain/entities/user_entity.dart';
import 'package:mangochatapp/features/user/domain/repository/user_repository.dart';

class CreateUserUseCase {
  final UserRepository repository;

  CreateUserUseCase({required this.repository});

  Future<void> call(UserEntity userM)  => repository.createUser(userM);
}
