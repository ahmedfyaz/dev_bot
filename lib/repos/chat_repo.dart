import 'dart:io';
import 'dart:math';

import 'package:chat_app/model/chat_message_model.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:dio/dio.dart';
class ChatRepo {
  static chatTextGenrationRepo(List<ChatMessageModel>previousMessages)
  async{
    try{
      Dio dio = Dio();


      final response = await dio.post("https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=${API_KEY}",data:{
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
      }
      );
    }
    on SocketException {
      throw e.toString();
    }
  }
}