import '../core/config/app_config.dart';
import 'base/api_response.dart';
import 'base/base_service.dart';

class PaymentService extends BaseService {
  PaymentService() : super(servicePath: AppConfig.serviceEndpoints['payment']!);

  @override
  String get servicePath => AppConfig.serviceEndpoints['payment']!;

  // TODO: Implement payment functionality
  Future<ApiResponse<String>> placeholder() async {
    return ApiResponse.success('Payment service placeholder');
  }
}