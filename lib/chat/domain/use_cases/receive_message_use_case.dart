import '../entites/messeage_entity.dart';
import '../repositories/chat_repo.dart';

class ReceiveMessageUseCase {
  final ChatRepository repository;

  ReceiveMessageUseCase(this.repository);

  Stream<ChatMessageEntity> call(String authToken) {
    return repository.receiveMessages(authToken);
  }
}