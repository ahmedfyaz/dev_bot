import 'package:bloc/bloc.dart';
import 'package:chat_app/model/chat_message_model.dart';
import 'package:meta/meta.dart';

part 'dev_event.dart';
part 'dev_state.dart';

class DevBloc extends Bloc<DevEvent, DevState> {
  DevBloc() : super(DevInitial()) {
    on<DevEvent>((event, emit) {
      // TODO: implement event handler
    });
    List<ChatMessageModel> messages = [];
  }
}
