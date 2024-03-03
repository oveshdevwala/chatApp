// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mangochatapp/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
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
  UserModel({
    required this.name,
   required this.id,
    this.email,
   required this.mobileNumber,
    this.pushToken,
    this.profilePic,
    this.notification,
    this.lastOnline,
    this.isOnline,
    this.status,
    this.profilePicStatus,
    this.whoCanMsgMe,
    this.accountCreatedDate,
  }) : super(
            name: name,
            id: id,
            email: email,
            mobileNumber: mobileNumber,
            pushToken: pushToken,
            profilePic: profilePic,
            notification: notification,
            lastOnline: lastOnline,
            isOnline: isOnline,
            status: status,
            profilePicStatus: profilePicStatus,
            whoCanMsgMe: whoCanMsgMe,
            accountCreatedDate: accountCreatedDate);

  Map<String, dynamic> toDocument() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'email': email,
      'mobileNumber': mobileNumber,
      'pushToken': pushToken,
      'profilePic': profilePic,
      'notification': notification,
      'lastOnline': lastOnline,
      'isOnline': isOnline,
      'status': status,
      'profilePicStatus': profilePicStatus,
      'whoCanMsgMe': whoCanMsgMe,
      'accountCreatedDate': accountCreatedDate,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final snap = snapshot.data() as Map<String, dynamic>;

    return UserModel(
      name: snap['name'] as String,
      id: snap['id'] != null ? snap['id'] as String : null,
      email: snap['email'] != null ? snap['email'] as String : null,
      mobileNumber:
          snap['mobileNumber'] != null ? snap['mobileNumber'] as String : null,
      pushToken: snap['pushToken'] != null ? snap['pushToken'] as String : null,
      profilePic:
          snap['profilePic'] != null ? snap['profilePic'] as String : null,
      notification:
          snap['notification'] != null ? snap['notification'] as bool : null,
      lastOnline: snap['lastOnline'] != null ? snap['lastOnline'] as int : null,
      isOnline: snap['isOnline'] != null ? snap['isOnline'] as bool : null,
      status: snap['status'] != null ? snap['status'] as int : null,
      profilePicStatus: snap['profilePicStatus'] != null
          ? snap['profilePicStatus'] as int
          : null,
      whoCanMsgMe:
          snap['whoCanMsgMe'] != null ? snap['whoCanMsgMe'] as int : null,
      accountCreatedDate: snap['accountCreatedDate'] != null
          ? snap['accountCreatedDate'] as String
          : null,
    );
  }
}
