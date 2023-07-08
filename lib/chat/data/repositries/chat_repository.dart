import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/network/network_info.dart';
import '../../domain/entites/messeage_entity.dart';
import '../../domain/repositories/chat_repo.dart';
import '../data_source/chat_remote_data_source.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ChatRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, String>> getChatIdAndStart(
      String senderId, String receiverId, String text) async {
    try {
      final response = await remoteDataSource.getChatIdAndStart(
        senderId,
        receiverId,
        text,
      );
      return Right(response);
    } catch (e) {
      return Left(ServerFailure('Failed to start chat'));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendMessage(String senderId,
      String conversationId, String text, ) async {
    try {
      await remoteDataSource.sendMessage(senderId, conversationId, text);
      return Right(unit);
    } catch (e) {
      return Left(ServerFailure('Failed to send message'));
    }
  }

  @override
  Stream<ChatMessageEntity> receiveMessages(String authToken) {
    return remoteDataSource.receiveMessages(authToken);
  }
}
