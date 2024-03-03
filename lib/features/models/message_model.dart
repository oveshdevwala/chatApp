
class MessageModel {
  String messsage;
  int sendAt;
  int? readAt;
  String fromId;
  String messageId;
  String? replayedMsg;
  String toId;
  bool? imageUrl;
  bool? audioUrl;
  bool? videoUrl;
  String? fileUrl;
  bool isDeleted;
  ///bool
  int? reaction;
  String messageType;

  MessageModel({
    required this.messsage,
    required this.sendAt,
    required this.messageId,
    this.readAt,
    this.replayedMsg,
    required this.fromId,
    required this.toId,
    this.imageUrl,
    this.isDeleted = false,
    this.audioUrl,
    this.videoUrl,
    this.fileUrl,
    this.reaction,
    this.messageType = 'text',
  });

  factory MessageModel.fromDoc(Map<String, dynamic> doc) {
    return MessageModel(
      messageId: doc['messageId'],
      messsage: doc['messsage'],
      sendAt: doc['sendAt'],
      fromId: doc['fromId'],
      toId: doc['toId'],
      audioUrl: doc['audioUrl'],
      fileUrl: doc['fileUrl'],
      imageUrl: doc['imageUrl'],
      isDeleted: doc['isDeleted'],
      messageType: doc['messageType'],
      readAt: doc['readAt'],
      reaction: doc['reaction'],
      replayedMsg: doc['replayedMsg'],
      videoUrl: doc['videoUrl'],
    );
  }

  Map<String, dynamic> toDoc() {
    return <String, dynamic>{
      'messsage': messsage,
      'sendAt': sendAt,
      'readAt': readAt,
      'messageId': messageId,
      'fromId': fromId,
      'replayedMsg': replayedMsg,
      'toId': toId,
      'imageUrl': imageUrl,
      'audioUrl': audioUrl,
      'videoUrl': videoUrl,
      'fileUrl': fileUrl,
      'isDeleted': isDeleted,
      'reaction': reaction,
      'messageType': messageType,
    };
  }


}

enum MessageType { text, audio, video, file, document }
