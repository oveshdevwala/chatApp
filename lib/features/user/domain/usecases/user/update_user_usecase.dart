import 'package:mangochatapp/features/user/domain/entities/user_entity.dart';
import 'package:mangochatapp/features/user/domain/repository/user_repository.dart';

class UpdateUserUseCase {
  final UserRepository repository;
  UpdateUserUseCase(this.repository);
  Future<void>call(UserEntity userM) => repository.updateUser(userM);
}
