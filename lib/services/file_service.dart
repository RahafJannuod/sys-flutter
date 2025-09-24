import '../core/config/app_config.dart';
import 'base/api_response.dart';
import 'base/base_service.dart';

class FileService extends BaseService {
  FileService() : super(servicePath: AppConfig.serviceEndpoints['file']!);

  @override
  String get servicePath => AppConfig.serviceEndpoints['file']!;

  // TODO: Implement file functionality
  Future<ApiResponse<String>> placeholder() async {
    return ApiResponse.success('File service placeholder');
  }
}