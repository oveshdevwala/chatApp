// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';

class ContactModel {
  String Number;
  String name;
  Uint8List photo;
  ContactModel({
    required this.Number,
    required this.name,
    required this.photo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Number': Number,
      'name': name,
      'photo': photo,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      Number: map['Number'] as String,
      name: map['name'] as String,
      photo: map['photo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactModel.fromJson(String source) => ContactModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
