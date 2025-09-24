import 'dart:io';

import '../core/config/app_config.dart';
import '../models/product_model.dart';
import 'base/api_response.dart';
import 'base/base_service.dart';

class ProductService extends BaseService {
  ProductService() : super(servicePath: AppConfig.serviceEndpoints['product']!);

  @override
  String get servicePath => AppConfig.serviceEndpoints['product']!;

  Future<ApiResponse<List<ProductModel>>> getProducts({
    String? category,
    double? latitude,
    double? longitude,
    double? radius,
    int page = 1,
    int limit = 20,
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      'limit': limit,
    };

    if (category != null) queryParams['category'] = category;
    if (latitude != null && longitude != null) {
      queryParams['latitude'] = latitude;
      queryParams['longitude'] = longitude;
      queryParams['radius'] = radius ?? AppConfig.maxSearchRadius;
    }

    final response = await get<List<ProductModel>>(
      '/products',
      queryParameters: queryParams,
    );

    if (response.success && response.data != null) {
      final products = (response.data as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();
      return ApiResponse.success(products);
    }

    return ApiResponse.error(response.message ?? 'Failed to fetch products');
  }

  Future<ApiResponse<ProductModel>> getProduct(String productId) async {
    return await get<ProductModel>(
      '/products/$productId',
      fromJson: ProductModel.fromJson,
    );
  }

  Future<ApiResponse<ProductModel>> createProduct({
    required String title,
    required String description,
    required String category,
    double? price,
    List<String>? imagePaths,
    Map<String, dynamic>? additionalData,
  }) async {
    final data = {
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      ...?additionalData,
    };

    return await post<ProductModel>(
      '/products',
      data,
      fromJson: ProductModel.fromJson,
    );
  }

  Future<ApiResponse<ProductModel>> updateProduct({
    required String productId,
    String? title,
    String? description,
    String? category,
    double? price,
    bool? isActive,
  }) async {
    final data = <String, dynamic>{};
    if (title != null) data['title'] = title;
    if (description != null) data['description'] = description;
    if (category != null) data['category'] = category;
    if (price != null) data['price'] = price;
    if (isActive != null) data['is_active'] = isActive;

    return await put<ProductModel>(
      '/products/$productId',
      data,
      fromJson: ProductModel.fromJson,
    );
  }

  Future<ApiResponse<String>> deleteProduct(String productId) async {
    return await delete<String>('/products/$productId');
  }

  Future<ApiResponse<List<String>>> uploadProductImages({
    required String productId,
    required List<String> imagePaths,
  }) async {
    // This would typically be done during product creation
    // For now, return a placeholder implementation
    final imageUrls = <String>[];

    for (final imagePath in imagePaths) {
      final response = await uploadFile(
        '/products/$productId/images',
        File(imagePath),
        fieldName: 'image',
      );

      if (response.success && response.data != null) {
        imageUrls.add(response.data!);
      }
    }

    return ApiResponse.success(imageUrls);
  }

  Future<ApiResponse<List<ProductModel>>> getUserProducts(String userId) async {
    final response = await get<List<ProductModel>>(
      '/products/user/$userId',
    );

    if (response.success && response.data != null) {
      final products = (response.data as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();
      return ApiResponse.success(products);
    }

    return ApiResponse.error(response.message ?? 'Failed to fetch user products');
  }

  Future<ApiResponse<List<ProductModel>>> getFavorites() async {
    final response = await get<List<ProductModel>>('/products/favorites');

    if (response.success && response.data != null) {
      final products = (response.data as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();
      return ApiResponse.success(products);
    }

    return ApiResponse.error(response.message ?? 'Failed to fetch favorites');
  }

  Future<ApiResponse<String>> toggleFavorite(String productId) async {
    return await post<String>('/products/$productId/favorite', {});
  }

  Future<ApiResponse<List<ProductModel>>> searchProducts(String query) async {
    final response = await get<List<ProductModel>>(
      '/products/search',
      queryParameters: {'q': query},
    );

    if (response.success && response.data != null) {
      final products = (response.data as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();
      return ApiResponse.success(products);
    }

    return ApiResponse.error(response.message ?? 'Failed to search products');
  }
}