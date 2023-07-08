

import '../../domain/entites/messeage_entity.dart';



class ChatMessageModel extends ChatMessageEntity {
  const ChatMessageModel({
    required String conversationId,
    required String text,
    required String senderId,
    required String receiverId,
    required DateTime time,
  }) : super(
          conversationId: conversationId,
          text: text,
          senderId: senderId,
          receiverId: receiverId,
          time: time,
        );

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      conversationId: json['conversationId'] as String,
      text: json['text'] as String,
      senderId: json['sender'] as String,
       
      time: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'conversationId': conversationId,
      'text': text,
      'sender': senderId,
      'receiver': receiverId, 
      'createdAt': time.toIso8601String(),
    };
  }
}
