import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entites/messeage_entity.dart';
import '../repositories/chat_repo.dart';

class SendMessageUseCase {
  final ChatRepository repository;

  SendMessageUseCase(this.repository);

  Future<Either<Failure, Unit>> call(String senderId, String conversationId, String message, ) async {
    return await repository.sendMessage(senderId, conversationId, message);
  }
}