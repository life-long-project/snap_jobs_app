import 'dart:convert';
import 'package:http/http.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import 'package:snap_jobs/core/network/api_constants.dart';

import '../../../core/network/base_http_client.dart';
import '../../domain/entites/messeage_entity.dart';
import '../model/chat_model.dart';

// abstract class ChatRemoteDataSource {
//   Future<String> getChatIdAndStart(
//       String senderId, String receiverId, String text);
//   Future<void> sendMessage(String senderId, String conversationId, String text);
//   Future<ChatMessageModel> receiveMessages(String conversationId);
// }

// class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
//   final BaseHttpClient client;

//   ChatRemoteDataSourceImpl({required this.client});

//   @override
//   Future<String> getChatIdAndStart(
//     String senderId,
//     String receiverId,
//     String text,
//   ) async {
//     try {
//       final response = await client.post(
//         Uri.parse(ApiConstants.startChatPath),
//         body: jsonEncode({
//           'senderId': senderId,
//           'receiverId': receiverId,
//           'text': text,
//         }),
//       );
//       final conversationId = jsonDecode(response.body)['conversationId'];
//       return conversationId;
//     } catch (e) {
//       throw Exception('Failed to start chat');
//     }
//   }

//   @override
//   Future<void> sendMessage(
//       String senderId, String conversationId, String text) async {
//     try {
//       final response = await client.post(
//         Uri.parse(ApiConstants.sendMessageToConversationPath),
//         body: jsonEncode({
//           'sender': senderId,
//           'conversationId': conversationId,
//           'text': text,
//         }),
//       );

//       if (response.statusCode != 200) {
//         throw Exception('Failed to send message');
//       }
//     } catch (e) {
//       throw Exception('Failed to send message');
//     }
//   }

//   @override
//     Future<List<ChatMessageEntity>> receiveMessages(String conversationId) async {
//     final url = Uri.parse('');

//     final response = await client.get(url);

//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       final List<ChatMessageEntity> messages = data
//           .map((message) => ChatMessageModel.fromJson(message).toEntity())
//           .toList();
//       return messages;
//     } else {
//       throw Exception('Failed to get messages');
//     }
//   }
// }

