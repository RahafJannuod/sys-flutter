class ServiceException implements Exception {
  final String message;
  final int statusCode;
  final Map<String, dynamic>? errors;
  final ServiceExceptionType type;

  const ServiceException({
    required this.message,
    required this.statusCode,
    required this.type,
    this.errors,
  });

  factory ServiceException.timeout() {
    return const ServiceException(
      message: 'Request timeout. Please check your internet connection.',
      statusCode: 408,
      type: ServiceExceptionType.timeout,
    );
  }

  factory ServiceException.noInternet() {
    return const ServiceException(
      message: 'No internet connection available.',
      statusCode: 0,
      type: ServiceExceptionType.noInternet,
    );
  }

  factory ServiceException.badRequest({
    String? message,
    Map<String, dynamic>? errors,
  }) {
    return ServiceException(
      message: message ?? 'Bad request.',
      statusCode: 400,
      type: ServiceExceptionType.badRequest,
      errors: errors,
    );
  }

  factory ServiceException.unauthorized() {
    return const ServiceException(
      message: 'Unauthorized. Please sign in again.',
      statusCode: 401,
      type: ServiceExceptionType.unauthorized,
    );
  }

  factory ServiceException.forbidden() {
    return const ServiceException(
      message: 'Access forbidden.',
      statusCode: 403,
      type: ServiceExceptionType.forbidden,
    );
  }

  factory ServiceException.notFound() {
    return const ServiceException(
      message: 'Requested resource not found.',
      statusCode: 404,
      type: ServiceExceptionType.notFound,
    );
  }

  factory ServiceException.validationError({
    required Map<String, dynamic> errors,
  }) {
    return ServiceException(
      message: 'Validation failed.',
      statusCode: 422,
      type: ServiceExceptionType.validation,
      errors: errors,
    );
  }

  factory ServiceException.serverError({String? message}) {
    return ServiceException(
      message: message ?? 'Internal server error.',
      statusCode: 500,
      type: ServiceExceptionType.serverError,
    );
  }

  factory ServiceException.unknown({String? message}) {
    return ServiceException(
      message: message ?? 'An unknown error occurred.',
      statusCode: 0,
      type: ServiceExceptionType.unknown,
    );
  }

  @override
  String toString() {
    return 'ServiceException(type: $type, message: $message, statusCode: $statusCode)';
  }

  bool get isNetworkError =>
    type == ServiceExceptionType.timeout ||
    type == ServiceExceptionType.noInternet;

  bool get isAuthError =>
    type == ServiceExceptionType.unauthorized ||
    type == ServiceExceptionType.forbidden;

  bool get isValidationError => type == ServiceExceptionType.validation;

  bool get isServerError => type == ServiceExceptionType.serverError;
}

enum ServiceExceptionType {
  timeout,
  noInternet,
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  validation,
  serverError,
  unknown,
}