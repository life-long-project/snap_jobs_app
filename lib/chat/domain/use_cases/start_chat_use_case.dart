import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../repositories/chat_repo.dart';

class StartChatUseCase {
  final ChatRepository repository;

  StartChatUseCase(this.repository);

  Future<Either<Failure, String>> call(
      String senderId, String receiverId, String text) async {
    final chatId =
        await repository.getChatIdAndStart(senderId, receiverId, text);
    return chatId;
  }
}
