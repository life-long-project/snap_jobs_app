

import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entites/messeage_entity.dart';

abstract class ChatRepository {
  Future<Either<Failure, Unit>> startChat(String senderId, String receiverId, String text);
  Future<Either<Failure, Unit>> sendMessage(String senderId, String conversationId, String text, String authToken);
  Stream<ChatMessageEntity> receiveMessages(String authToken);
}