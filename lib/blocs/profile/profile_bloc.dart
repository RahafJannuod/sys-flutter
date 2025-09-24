import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../services/user_service.dart';
import '../../services/file_service.dart';
import '../../models/user_model.dart';

// Events
abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileLoadRequested extends ProfileEvent {}

class ProfileUpdateRequested extends ProfileEvent {
  final String? name;
  final String? phoneNumber;
  final String? bio;
  final String? location;

  ProfileUpdateRequested({this.name, this.phoneNumber, this.bio, this.location});

  @override
  List<Object?> get props => [name, phoneNumber, bio, location];
}

// States
abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserModel user;

  ProfileLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});

  @override
  List<Object> get props => [message];
}

// BLoC
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserService userService;
  final FileService fileService;

  ProfileBloc({
    required this.userService,
    required this.fileService,
  }) : super(ProfileInitial()) {
    on<ProfileLoadRequested>(_onProfileLoadRequested);
    on<ProfileUpdateRequested>(_onProfileUpdateRequested);
  }

  Future<void> _onProfileLoadRequested(
    ProfileLoadRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());

    try {
      final response = await userService.getCurrentUser();

      if (response.success && response.data != null) {
        emit(ProfileLoaded(user: response.data!));
      } else {
        emit(ProfileError(message: response.message ?? 'Failed to load profile'));
      }
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }

  Future<void> _onProfileUpdateRequested(
    ProfileUpdateRequested event,
    Emitter<ProfileState> emit,
  ) async {
    if (state is! ProfileLoaded) return;

    final currentState = state as ProfileLoaded;
    emit(ProfileLoading());

    try {
      final response = await userService.updateProfile(
        name: event.name,
        phoneNumber: event.phoneNumber,
        bio: event.bio,
        location: event.location,
      );

      if (response.success && response.data != null) {
        emit(ProfileLoaded(user: response.data!));
      } else {
        emit(ProfileError(message: response.message ?? 'Failed to update profile'));
        // Restore previous state after error
        emit(currentState);
      }
    } catch (e) {
      emit(ProfileError(message: e.toString()));
      emit(currentState);
    }
  }
}