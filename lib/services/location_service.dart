import '../core/config/app_config.dart';
import 'base/api_response.dart';
import 'base/base_service.dart';

class LocationService extends BaseService {
  LocationService() : super(servicePath: AppConfig.serviceEndpoints['location']!);

  @override
  String get servicePath => AppConfig.serviceEndpoints['location']!;

  // TODO: Implement location functionality
  Future<ApiResponse<String>> placeholder() async {
    return ApiResponse.success('Location service placeholder');
  }
}