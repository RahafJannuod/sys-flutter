import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../services/chat_service.dart';

// Events
abstract class ChatsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChatsLoadRequested extends ChatsEvent {}

// States
abstract class ChatsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChatsInitial extends ChatsState {}

class ChatsLoading extends ChatsState {}

class ChatsLoaded extends ChatsState {
  final List<dynamic> chats; // TODO: Create ChatModel

  ChatsLoaded({required this.chats});

  @override
  List<Object> get props => [chats];
}

class ChatsError extends ChatsState {
  final String message;

  ChatsError({required this.message});

  @override
  List<Object> get props => [message];
}

// BLoC
class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final ChatService chatService;

  ChatsBloc({required this.chatService}) : super(ChatsInitial()) {
    on<ChatsLoadRequested>(_onChatsLoadRequested);
  }

  Future<void> _onChatsLoadRequested(
    ChatsLoadRequested event,
    Emitter<ChatsState> emit,
  ) async {
    emit(ChatsLoading());

    try {
      // TODO: Implement actual chat loading
      emit(ChatsLoaded(chats: const []));
    } catch (e) {
      emit(ChatsError(message: e.toString()));
    }
  }
}