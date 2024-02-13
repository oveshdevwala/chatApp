// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String name;
  String? id;
  String? email;
  String? mobileNumber;
  String? profilePic;
  String? lastMessage;
  int? lastOnline;
  bool? isOnline = false;
  int? status = 1; // 1> Active, 2> inActive, 3>Suspended
  int? profilePicStatus = 1; // 1> publoc 2> private, 3> only My Contacts
  int? whoCanMsgMe = 1; // 1>Everyone,  2>Contact Only, 3> receive Request
  String? accountCreatedDate;
  UserModel({
    required this.name,
    this.accountCreatedDate,
    this.lastOnline=0,
    required this.id,
     this.lastMessage,
     this.email='',
    required this.mobileNumber,
     this.profilePic,
     this.isOnline,
     this.status,
    this.profilePicStatus,
    this.whoCanMsgMe,
  });

  factory UserModel.fromDoc(Map<String, dynamic> doc) {
    return UserModel(
      accountCreatedDate: doc['accountCreatedDate'],
        name: doc['name'],
        id: doc['id'],
        lastMessage: doc['lastMessage'],
        lastOnline: doc['lastOnline'],
        email: doc['email'],
        mobileNumber: doc['mobileNumber'],
        profilePic: doc['profilePic'],
        isOnline: doc['isOnline'],
        status: doc['status'],
        profilePicStatus: doc['profilePicStatus'],
        whoCanMsgMe: doc['whoCanMsgMe']);
  }
  Map<String, dynamic> toDoc() {
    return {
      'name': name,
      'lastOnline': lastOnline,
      'accountCreatedDate': accountCreatedDate,
      'email': email,
      'mobileNumber': mobileNumber,
      'profilePic': profilePic,
      'isOnline': isOnline,
      'id':id,
      'lastMessage':lastMessage,
      'status': status,
      'profilePicStatus': profilePicStatus,
      'whoCanMsgMe': whoCanMsgMe,
    };
  }
}
