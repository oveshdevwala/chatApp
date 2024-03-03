import 'package:mangochatapp/features/user/domain/entities/user_entity.dart';
import 'package:mangochatapp/features/user/domain/repository/user_repository.dart';

class GetSignUserUseCase {
  final UserRepository repository;
  GetSignUserUseCase(this.repository);
  Stream<List<UserEntity>> call(String uID) => repository.getSignUser(uID);
}
