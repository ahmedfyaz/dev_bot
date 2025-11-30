part of 'dev_bloc.dart';

@immutable
sealed class DevState {}

final class DevInitial extends DevState {}
class ChatSuccessState extends DevState {
  final List<ChatMessageModel> messages;
  ChatSuccessState({required this.messages});
}