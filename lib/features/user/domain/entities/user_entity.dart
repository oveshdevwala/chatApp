// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserEntity {
  String? name;
  String? id;
  String? email;
  String? mobileNumber;
  String? pushToken;
  String? profilePic;
  bool? notification;
  int? lastOnline;
  bool? isOnline = false;
  int? status = 1; // 1> Active, 2> inActive, 3>Suspended
  int? profilePicStatus = 1; // 1> publoc 2> private, 3> only My Contacts
  int? whoCanMsgMe = 1; // 1>Everyone,  2>Contact Only, 3> receive Request
  String? accountCreatedDate;
  UserEntity({
    required this.name,
    this.accountCreatedDate,
    this.lastOnline=0,
     this.id,
     this.pushToken,
     this.notification,
     this.email='',
     this.mobileNumber,
     this.profilePic,
     this.isOnline,
     this.status,
    this.profilePicStatus,
    this.whoCanMsgMe,
  });

}
