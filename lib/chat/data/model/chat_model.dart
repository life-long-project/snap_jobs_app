

import '../../domain/entites/messeage_entity.dart';




class ChatMessageModel extends ChatMessageEntity {
   ChatMessageModel({
    required String conversationId,
    required String text,
    required String senderId,
    required String receiverId,
    required DateTime createdAt,
    required DateTime updatedAt,
    
  }) : super(
          conversationId: conversationId,
          text: text,
          senderId: senderId,
          receiverId: receiverId,
          createdAt: createdAt,
          updatedAt: updatedAt,
         
        );

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      conversationId: json['savedMessage']['conversationId'],
      text: json['savedMessage']['text'],
      senderId: json['savedMessage']['sender'],
      receiverId: '',
      createdAt: DateTime.parse(json['savedMessage']['createdAt']),
      updatedAt: DateTime.parse(json['savedMessage']['updatedAt']),
     
    );
  }
}
