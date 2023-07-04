import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../repositories/chat_repo.dart';

class StartChatUseCase {
  final ChatRepository repository;

  StartChatUseCase(this.repository);

  Future<Either<Failure, Unit>> call(String senderId, String receiverId, String text) async {
    return await repository.startChat(senderId, receiverId, text);
  }
}