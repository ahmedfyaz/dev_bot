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
  ) async {
    messages.add(
      ChatMessageModel(
        role: "user",
        parts: [ChatPartModel(text: event.inputMessage)],
      ),
    );
    emit(ChatSuccessState(messages: messages));
    emit(ChatGenerationLoadingState());

    try {
      final generatedMessage = await ChatRepo.chatTextGenerationRepo(messages);
      if (generatedMessage.isNotEmpty) {
        messages.add(
          ChatMessageModel(
            role: 'model',
            parts: [ChatPartModel(text: generatedMessage)],
          ),
        );
        emit(ChatSuccessState(messages: messages));
      }
    } catch (e) {
      emit(ChatGenerationErrorState(error: e.toString()));
    }
  }
}
