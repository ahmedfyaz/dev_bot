part of 'dev_bloc.dart';

@immutable
sealed class DevEvent {}
class ChatGenerateNewTextMessageEvent extends DevEvent {
  final String inputMessage;
  ChatGenerateNewTextMessageEvent({required this.inputMessage}){
}
}