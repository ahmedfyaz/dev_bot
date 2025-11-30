import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app/model/chat_message_model.dart';
import 'package:chat_app/repos/chat_repo.dart';
import 'package:meta/meta.dart';

part 'dev_event.dart';
part 'dev_state.dart';

class DevBloc extends Bloc<DevEvent, DevState> {
  DevBloc() : super(DevInitial()) {
    on<ChatGenerateNewTextMessageEvent>(chatGenerateNewTextMessageEvent);
  }
  List<ChatMessageModel> messages = [];
  FutureOr<void> chatGenerateNewTextMessageEvent(
    ChatGenerateNewTextMessageEvent event,
    Emitter<DevState> emit,
  ) async{
    messages.add(
      ChatMessageModel(
        role: "user",
        parts: [ChatPartModel(text: event.inputMessage)],
      ),
    );
    emit(ChatSuccessState(messages: messages));
    await ChatRepo.chatTextGenrationRepo(messages);
  }
}
