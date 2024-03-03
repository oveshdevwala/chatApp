
import 'package:mangochatapp/features/user/domain/entities/user_entity.dart';
import 'package:mangochatapp/features/user/domain/repository/user_repository.dart';

class GetAllUserUseCase {
  final UserRepository repository;
  GetAllUserUseCase(this.repository);
  Stream<List<UserEntity>> call() => repository.getAllUser();
}
