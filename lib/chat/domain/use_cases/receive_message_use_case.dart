import '../entites/messeage_entity.dart';
import '../repositories/chat_repo.dart';

class ReceiveMessageUseCase {
  final ChatRepository repository;

  ReceiveMessageUseCase(this.repository);

  Future<List<ChatMessageEntity>> call(String authToken) {
    return repository.receiveMessages(authToken);
  }
}