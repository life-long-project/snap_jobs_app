import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/entites/messeage_entity.dart';
import '../../domain/repositories/chat_repo.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatApiProvider chatApiProvider;

  ChatRepositoryImpl(this.chatApiProvider);

  @override
  Future<Either<Failure, Unit>> startChat(String senderId, String receiverId, String text) async {
    try {
      await chatApiProvider.startChat(senderId, receiverId, text);
      return Right(unit);
    } catch (e) {
      return Left(Failure('Failed to start chat'));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendMessage(String senderId, String conversationId, String text, String authToken) async {
    try {
      await chatApiProvider.sendMessage(senderId, conversationId, text, authToken);
      return Right(unit);
    } catch (e) {
      return Left(Failure('Failed to send message'));
    }
  }

  @override
  Stream<ChatMessageEntity> receiveMessages(String authToken) {
    // Implement receiving messages through Socket.IO or other real-time communication library
    // Return a stream of ChatMessageEntity objects

    // Example implementation using a sample stream of messages
    return Stream.fromIterable([
      ChatMessageModel(
        conversationId: '649987003ee23db82d1b1e99',
        text: 'Hey omar',
        sender: '6463b901b377ff4bae1c9c1a',
        id: '64a45d8e54795a69522de7c5',
        createdAt: DateTime.parse('2023-07-04T17:57:34.496Z'),
        updatedAt: DateTime.parse('2023-07-04T17:57:34.496Z'),
        v: 0,
      ),
      ChatMessageModel(
        conversationId: '649987003ee23db82d1b1e99',
        text: 'heyy Ayman',
        sender: '6463b901b377ff4bae1c9c1a',
        id: '64a389098dd8dd8cf1b55cc3',
        createdAt: DateTime.parse('2023-07-04T02:50:49.944Z'),
        updatedAt: DateTime.parse('2023-07-04T02:50:49.944Z'),
        v: 0,
      ),
    ]);
  }
}