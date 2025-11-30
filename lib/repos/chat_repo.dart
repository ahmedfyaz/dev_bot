import 'dart:io';

import 'package:chat_app/model/chat_message_model.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:dio/dio.dart';

class ChatRepo {
  static Future<String> chatTextGenerationRepo(
      List<ChatMessageModel> previousMessages) async {
    try {
      Dio dio = Dio();

      final response = await dio.post(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=${API_KEY}",
        data: {
          "system_instruction": {
            "parts": [
              {
                "text":
                    "You are a master coder, a genius in the world of programming. You only know and talk about coding. Your purpose is to assist users with their programming questions and tasks."
              }
            ]
          },
          "contents": previousMessages.map((e) => e.toMap()).toList(),
          "generationConfig": {
            "temperature": 0.9,
            "topK": 1,
            "topP": 1,
            "maxOutputTokens": 2048,
            "stopSequences": []
          },
          "safetySettings": [
            {
              "category": "HARM_CATEGORY_HARASSMENT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
            {
              "category": "HARM_CATEGORY_HATE_SPEECH",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
            {
              "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
            {
              "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            }
          ]
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = response.data;
        if (jsonResponse['candidates'] != null &&
            jsonResponse['candidates'].isNotEmpty) {
          final parts = jsonResponse['candidates'][0]['content']?['parts'];
          if (parts != null && parts.isNotEmpty) {
            return parts[0]['text'] ?? '';
          }
        }
        return '';
      } else {
        throw Exception(
            'Failed to generate content: ${response.statusMessage}');
      }
    } on SocketException catch (e) {
      throw Exception('No Internet connection: ${e.message}');
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
            'API error: ${e.response?.statusCode} ${e.response?.statusMessage}\n${e.response?.data}');
      } else {
        throw Exception('Dio error: ${e.message}');
      }
    } catch (e) {
      throw Exception('An unknown error occurred: $e');
    }
  }
}
