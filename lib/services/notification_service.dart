import '../core/config/app_config.dart';
import 'base/api_response.dart';
import 'base/base_service.dart';

class NotificationService extends BaseService {
  NotificationService() : super(servicePath: AppConfig.serviceEndpoints['notification']!);

  @override
  String get servicePath => AppConfig.serviceEndpoints['notification']!;

  // TODO: Implement notification functionality
  Future<ApiResponse<String>> placeholder() async {
    return ApiResponse.success('Notification service placeholder');
  }
}