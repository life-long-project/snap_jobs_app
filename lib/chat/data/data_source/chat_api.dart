import 'dart:convert';

import 'package:snap_jobs/core/network/api_constants.dart';

import '../../../core/network/base_http_client.dart';
abstract class ChatRemoteDataSource {
  Future<void> startChat(String senderId, String receiverId, String text);
  Future<void> sendMessage(String senderId, String conversationId, String text);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final BaseHttpClient client;

  ChatRemoteDataSourceImpl({required this.client});

  @override
  Future<void> startChat(String senderId, String receiverId, String text) async {
    try {
      final response = await client.post(
        Uri.parse(ApiConstants.startChatPath),
        body: jsonEncode({
          'senderId': senderId,
          'receiverId': receiverId,
          'text': text,
        }),
        
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to start chat');
      }
    } catch (e) {
      throw Exception('Failed to start chat');
    }
  }

  @override
  Future<void> sendMessage(String senderId, String conversationId, String text) async {
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
}