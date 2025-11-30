import 'package:chat_app/model/chat_message_model.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:dio/dio.dart';
class ChatRepo {
  static chatTextGenrationRepo(List<ChatMessageModel>previousMessages)
  async*{
    Dio dio = Dio();
    
    
    final response = dio.post("https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=${API_KEY}");
  }
}