import 'dart:io';

import 'package:dio/dio.dart';
import '../../core/config/app_config.dart';
import 'api_response.dart';
import 'service_exception.dart';

abstract class BaseService {
  late final Dio _dio;
  final String _baseUrl = AppConfig.baseApiUrl;

  BaseService({String? servicePath}) {
    _dio = Dio(BaseOptions(
      baseUrl: servicePath != null ? '$_baseUrl$servicePath' : _baseUrl,
      connectTimeout: AppConfig.networkTimeout,
      receiveTimeout: AppConfig.networkTimeout,
      sendTimeout: AppConfig.networkTimeout,
      headers: _getDefaultHeaders(),
    ));

    _setupInterceptors();
  }

  String get servicePath;

  Map<String, String> _getDefaultHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'User-Agent': 'CommunityMarketplace/${AppConfig.appVersion}',
    };
  }

  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Add authentication token if available
          final token = await _getAuthToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          // Add locale header
          options.headers['Accept-Language'] = await _getLocale();

          handler.next(options);
        },
        onError: (error, handler) {
          final exception = _handleDioError(error);
          handler.reject(DioException(
            requestOptions: error.requestOptions,
            error: exception,
            type: DioExceptionType.unknown,
          ));
        },
      ),
    );

    // Add logging in debug mode
    if (AppConfig.enableAnalytics) {
      _dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
      ));
    }
  }

  Future<String?> _getAuthToken() async {
    // TODO: Implement token retrieval from secure storage
    return null;
  }

  Future<String> _getLocale() async {
    // TODO: Implement locale retrieval from app settings
    return 'ar-SA';
  }

  ServiceException _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ServiceException.timeout();

      case DioExceptionType.connectionError:
        return ServiceException.noInternet();

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode ?? 0;
        final data = error.response?.data;

        switch (statusCode) {
          case 400:
            return ServiceException.badRequest(
              message: data?['message'] ?? 'Bad request',
              errors: data?['errors'],
            );
          case 401:
            return ServiceException.unauthorized();
          case 403:
            return ServiceException.forbidden();
          case 404:
            return ServiceException.notFound();
          case 422:
            return ServiceException.validationError(
              errors: data?['errors'] ?? {},
            );
          case 500:
            return ServiceException.serverError();
          default:
            return ServiceException.unknown(
              message: data?['message'] ?? 'Unknown error occurred',
            );
        }

      default:
        return ServiceException.unknown();
    }
  }

  Future<ApiResponse<T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );

      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  Future<ApiResponse<T>> post<T>(
    String endpoint,
    Map<String, dynamic> data, {
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  Future<ApiResponse<T>> put<T>(
    String endpoint,
    Map<String, dynamic> data, {
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  Future<ApiResponse<T>> delete<T>(
    String endpoint, {
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    try {
      final response = await _dio.delete(endpoint);
      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  Future<ApiResponse<String>> uploadFile(
    String endpoint,
    File file, {
    Map<String, dynamic>? additionalData,
    String fieldName = 'file',
  }) async {
    try {
      final formData = FormData.fromMap({
        fieldName: await MultipartFile.fromFile(file.path),
        ...?additionalData,
      });

      final response = await _dio.post(endpoint, data: formData);
      return _handleResponse<String>(response, null);
    } catch (e) {
      return _handleError<String>(e);
    }
  }

  ApiResponse<T> _handleResponse<T>(
    Response response,
    T Function(Map<String, dynamic>)? fromJson,
  ) {
    final data = response.data;

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      T? parsedData;

      if (data != null && fromJson != null) {
        if (data is Map<String, dynamic>) {
          parsedData = fromJson(data['data'] ?? data);
        } else if (data is List) {
          parsedData = data.map((item) => fromJson(item)).toList() as T;
        }
      } else {
        parsedData = data;
      }

      return ApiResponse.success(
        parsedData as T,
        message: data?['message'],
        statusCode: response.statusCode,
      );
    } else {
      return ApiResponse.error(
        data?['message'] ?? 'Request failed',
        statusCode: response.statusCode,
        errors: data?['errors'],
      );
    }
  }

  ApiResponse<T> _handleError<T>(dynamic error) {
    if (error is DioException && error.error is ServiceException) {
      final serviceException = error.error as ServiceException;
      return ApiResponse.error(
        serviceException.message,
        statusCode: serviceException.statusCode,
        errors: serviceException.errors,
      );
    }

    return ApiResponse.error(
      error.toString(),
      statusCode: 0,
    );
  }

  void dispose() {
    _dio.close();
  }
}