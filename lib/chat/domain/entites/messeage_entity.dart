class ChatMessageEntity {
  final String conversationId;
  final String text;
  final String senderId;
  final String receiverId;
  final DateTime createdAt;
  final DateTime updatedAt;
  

  ChatMessageEntity({
    required this.conversationId,
    required this.text,
    required this.senderId,
    required this.receiverId,
    required this.createdAt,
    required this.updatedAt,
    
  });
}