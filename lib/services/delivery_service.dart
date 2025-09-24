import '../core/config/app_config.dart';
import 'base/api_response.dart';
import 'base/base_service.dart';

class DeliveryService extends BaseService {
  DeliveryService() : super(servicePath: AppConfig.serviceEndpoints['delivery']!);

  @override
  String get servicePath => AppConfig.serviceEndpoints['delivery']!;

  // TODO: Implement delivery functionality
  Future<ApiResponse<String>> placeholder() async {
    return ApiResponse.success('Delivery service placeholder');
  }
}