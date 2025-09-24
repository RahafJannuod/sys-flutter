import '../core/config/app_config.dart';
import 'base/api_response.dart';
import 'base/base_service.dart';

class ChatService extends BaseService {
  ChatService() : super(servicePath: AppConfig.serviceEndpoints['chat']!);

  @override
  String get servicePath => AppConfig.serviceEndpoints['chat']!;

  // TODO: Implement chat functionality
  Future<ApiResponse<String>> placeholder() async {
    return ApiResponse.success('Chat service placeholder');
  }
}