import 'dart:async';

import '../models/user_model.dart';
import 'base/api_response.dart';

class MockUserService {
  // Mock user data
  static const _mockUsers = {
    'test@example.com': {
      'password': 'password123',
      'user': {
        'id': '1',
        'email': 'test@example.com',
        'name': 'Test User',
        'phoneNumber': '+1234567890',
        'isVerified': true,
        'createdAt': '2024-01-01T00:00:00Z',
        'updatedAt': '2024-01-01T00:00:00Z',
      }
    },
    'admin@example.com': {
      'password': 'admin123',
      'user': {
        'id': '2',
        'email': 'admin@example.com',
        'name': 'Admin User',
        'phoneNumber': '+0987654321',
        'isVerified': true,
        'createdAt': '2024-01-01T00:00:00Z',
        'updatedAt': '2024-01-01T00:00:00Z',
      }
    },
  };

  Future<ApiResponse<UserModel>> authenticate({
    required String email,
    required String password,
  }) async {
    print('MockUserService: authenticate called with email: $email');

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    final mockUser = _mockUsers[email.toLowerCase()];

    if (mockUser == null) {
      print('MockUserService: User not found');
      return ApiResponse.error('User not found');
    }

    if (mockUser['password'] != password) {
      print('MockUserService: Invalid password');
      return ApiResponse.error('Invalid password');
    }

    print('MockUserService: Login successful');
    final userModel = UserModel.fromJson(mockUser['user'] as Map<String, dynamic>);
    return ApiResponse.success(userModel, message: 'Login successful');
  }

  Future<ApiResponse<UserModel>> register({
    required String email,
    required String password,
    required String name,
    String? phoneNumber,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1000));

    // Check if user already exists
    if (_mockUsers.containsKey(email.toLowerCase())) {
      return ApiResponse.error('User with this email already exists');
    }

    // Create new user
    final newUser = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      name: name,
      phoneNumber: phoneNumber,
      isVerified: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return ApiResponse.success(newUser, message: 'Registration successful');
  }

  Future<ApiResponse<UserModel>> getCurrentUser() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Return null to simulate no stored session
    return ApiResponse.error('No authenticated user found');
  }

  Future<ApiResponse<UserModel>> updateProfile({
    String? name,
    String? phoneNumber,
    String? bio,
    String? location,
  }) async {
    await Future.delayed(const Duration(milliseconds: 600));
    return ApiResponse.error('Profile update not implemented in mock service');
  }

  Future<ApiResponse<String>> uploadAvatar(String imagePath) async {
    await Future.delayed(const Duration(milliseconds: 1200));
    return ApiResponse.success('https://example.com/avatar.jpg', message: 'Avatar uploaded');
  }

  Future<ApiResponse<String>> requestPasswordReset(String email) async {
    await Future.delayed(const Duration(milliseconds: 800));

    if (!_mockUsers.containsKey(email.toLowerCase())) {
      return ApiResponse.error('User not found');
    }

    return ApiResponse.success('', message: 'Password reset email sent');
  }

  Future<ApiResponse<String>> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    await Future.delayed(const Duration(milliseconds: 600));
    return ApiResponse.success('', message: 'Password reset successful');
  }

  Future<ApiResponse<String>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    await Future.delayed(const Duration(milliseconds: 600));
    return ApiResponse.success('', message: 'Password changed successfully');
  }

  Future<ApiResponse<UserModel>> socialLogin({
    required String provider,
    required String token,
  }) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    // Create mock social user
    final socialUser = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: '${provider.toLowerCase()}@example.com',
      name: '$provider User',
      phoneNumber: null,
      isVerified: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return ApiResponse.success(socialUser, message: '$provider login successful');
  }

  Future<ApiResponse<String>> logout() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return ApiResponse.success('', message: 'Logged out successfully');
  }

  Future<ApiResponse<String>> deleteAccount() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return ApiResponse.success('', message: 'Account deleted successfully');
  }
}