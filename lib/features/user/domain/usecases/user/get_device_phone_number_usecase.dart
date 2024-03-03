import 'package:mangochatapp/features/user/domain/entities/contact_entity.dart';
import 'package:mangochatapp/features/user/domain/repository/user_repository.dart';

class GetDevicePhoneNumberUseCase {
  final UserRepository repository;
  GetDevicePhoneNumberUseCase(this.repository);
 Future<List<ContactEntity>> call() => repository.getDevicePhoneNumber();
}
