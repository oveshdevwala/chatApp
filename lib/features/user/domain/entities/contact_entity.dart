// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

class ContactEntity {
  String phoneNumber;
  String label;
  String? uId;
  String? status;
  Uint8List userProfile;
  ContactEntity({
    required this.phoneNumber,
    required this.label,
     this.uId,
     this.status,
    required this.userProfile,
  });

}
