import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/user_service.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserService userService;

  AuthBloc({required this.userService}) : super(AuthInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthRegisterRequested>(_onAuthRegisterRequested);
    on<AuthSocialLoginRequested>(_onAuthSocialLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
    on<AuthPasswordResetRequested>(_onAuthPasswordResetRequested);
    on<AuthTokenRefreshRequested>(_onAuthTokenRefreshRequested);
  }

  Future<void> _onAuthCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      // Check if user is already authenticated
      // This would typically check stored token/session
      final response = await userService.getCurrentUser();

      if (response.success && response.data != null) {
        emit(AuthAuthenticated(user: response.data!));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onAuthLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final response = await userService.authenticate(
        email: event.email,
        password: event.password,
      );

      if (response.success && response.data != null) {
        emit(AuthAuthenticated(user: response.data!));
      } else {
        emit(AuthError(message: response.message ?? 'Login failed'));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onAuthRegisterRequested(
    AuthRegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final response = await userService.register(
        email: event.email,
        password: event.password,
        name: event.name,
        phoneNumber: event.phoneNumber,
      );

      if (response.success && response.data != null) {
        emit(AuthAuthenticated(user: response.data!));
      } else {
        emit(AuthError(message: response.message ?? 'Registration failed'));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onAuthSocialLoginRequested(
    AuthSocialLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final response = await userService.socialLogin(
        provider: event.provider,
        token: event.token,
      );

      if (response.success && response.data != null) {
        emit(AuthAuthenticated(user: response.data!));
      } else {
        emit(AuthError(message: response.message ?? 'Social login failed'));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      await userService.logout();
      emit(AuthUnauthenticated());
    } catch (e) {
      // Even if logout API fails, we should still log out locally
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onAuthPasswordResetRequested(
    AuthPasswordResetRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final response = await userService.requestPasswordReset(event.email);

      if (response.success) {
        emit(AuthPasswordResetSent(email: event.email));
      } else {
        emit(AuthError(message: response.message ?? 'Password reset failed'));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onAuthTokenRefreshRequested(
    AuthTokenRefreshRequested event,
    Emitter<AuthState> emit,
  ) async {
    // TODO: Implement token refresh logic
    // This would refresh the authentication token
  }
}