import 'dart:io';

import '../../core/config/app_config.dart';
import '../models/user_model.dart';
import 'base/api_response.dart';
import 'base/base_service.dart';
import 'mock_user_service.dart';

class UserService extends BaseService {
  UserService() : super(servicePath: AppConfig.serviceEndpoints['user']!);

  final MockUserService _mockService = MockUserService();

  @override
  String get servicePath => AppConfig.serviceEndpoints['user']!;

  Future<ApiResponse<UserModel>> authenticate({
    required String email,
    required String password,
  }) async {
    // Use mock service for development/testing
    return await _mockService.authenticate(email: email, password: password);
  }

  Future<ApiResponse<UserModel>> register({
    required String email,
    required String password,
    required String name,
    String? phoneNumber,
  }) async {
    // Use mock service for development/testing
    return await _mockService.register(
      email: email,
      password: password,
      name: name,
      phoneNumber: phoneNumber,
    );
  }

  Future<ApiResponse<UserModel>> socialLogin({
    required String provider,
    required String token,
  }) async {
    return await post<UserModel>(
      '/auth/social',
      {
        'provider': provider,
        'token': token,
      },
      fromJson: UserModel.fromJson,
    );
  }

  Future<ApiResponse<UserModel>> getCurrentUser() async {
    return await get<UserModel>(
      '/profile',
      fromJson: UserModel.fromJson,
    );
  }

  Future<ApiResponse<UserModel>> updateProfile({
    String? name,
    String? phoneNumber,
    String? bio,
    String? location,
  }) async {
    final data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (phoneNumber != null) data['phone_number'] = phoneNumber;
    if (bio != null) data['bio'] = bio;
    if (location != null) data['location'] = location;

    return await put<UserModel>(
      '/profile',
      data,
      fromJson: UserModel.fromJson,
    );
  }

  Future<ApiResponse<String>> uploadAvatar(String imagePath) async {
    return await uploadFile(
      '/profile/avatar',
      File(imagePath),
      fieldName: 'avatar',
    );
  }

  Future<ApiResponse<String>> requestPasswordReset(String email) async {
    return await post<String>(
      '/auth/password-reset-request',
      {'email': email},
    );
  }

  Future<ApiResponse<String>> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    return await post<String>(
      '/auth/password-reset',
      {
        'token': token,
        'new_password': newPassword,
      },
    );
  }

  Future<ApiResponse<String>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    return await put<String>(
      '/profile/password',
      {
        'current_password': currentPassword,
        'new_password': newPassword,
      },
    );
  }

  Future<ApiResponse<String>> logout() async {
    return await post<String>('/auth/logout', {});
  }

  Future<ApiResponse<String>> deleteAccount() async {
    return await delete<String>('/profile');
  }
}