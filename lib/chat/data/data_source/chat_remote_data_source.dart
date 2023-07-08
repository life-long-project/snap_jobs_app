import 'dart:convert';
import 'package:http/http.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import 'package:snap_jobs/core/network/api_constants.dart';

import '../../../core/network/base_http_client.dart';
import '../model/chat_model.dart';

abstract class ChatRemoteDataSource {
  Future<String> getChatIdAndStart(
      String senderId, String receiverId, String text);
  Future<void> sendMessage(String senderId, String conversationId, String text);
  Stream<ChatMessageModel> receiveMessages(String conversationId);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final BaseHttpClient client;

  ChatRemoteDataSourceImpl({required this.client});

  @override
  Future<String> getChatIdAndStart(
    String senderId,
    String receiverId,
    String text,
  ) async {
    try {
      final response = await client.post(
        Uri.parse(ApiConstants.startChatPath),
        body: jsonEncode({
          'senderId': senderId,
          'receiverId': receiverId,
          'text': text,
        }),
      );
      final conversationId = jsonDecode(response.body)['conversationId'];
      return conversationId;
    } catch (e) {
      throw Exception('Failed to start chat');
    }
  }

  @override
  Future<void> sendMessage(
      String senderId, String conversationId, String text) async {
    try {
      final response = await client.post(
        Uri.parse(ApiConstants.sendMessageToConversationPath),
        body: jsonEncode({
          'sender': senderId,
          'conversationId': conversationId,
          'text': text,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to send message');
      }
    } catch (e) {
      throw Exception('Failed to send message');
    }
  }

  @override
  Stream<ChatMessageModel> receiveMessages(String conversationId) {
    // TODO: implement receiveMessages
    throw UnimplementedError();
  }
}
