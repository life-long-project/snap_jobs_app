

import '../../domain/entites/messeage_entity.dart';

class ChatMessageModel extends ChatMessageEntity {
  ChatMessageModel({
    required String conversationId,
    required String text,
    required String sender,
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int v,
  }) : super(
          conversationId: conversationId,
          text: text,
          sender: sender,
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
          v: v,
        );

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      conversationId: json['conversationId'],
      text: json['text'],
      sender: json['sender'],
      id: json['_id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }
}
