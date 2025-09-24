abstract class AuthEvent {}

class AuthCheckRequested extends AuthEvent {}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequested({required this.email, required this.password});
}

class AuthRegisterRequested extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String? phoneNumber;

  AuthRegisterRequested({
    required this.email,
    required this.password,
    required this.name,
    this.phoneNumber,
  });
}

class AuthSocialLoginRequested extends AuthEvent {
  final String provider;
  final String token;

  AuthSocialLoginRequested({required this.provider, required this.token});
}

class AuthLogoutRequested extends AuthEvent {}

class AuthPasswordResetRequested extends AuthEvent {
  final String email;

  AuthPasswordResetRequested({required this.email});
}

class AuthTokenRefreshRequested extends AuthEvent {}