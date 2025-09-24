class ProductModel {
  final String id;
  final String title;
  final String description;
  final String category;
  final double? price;
  final List<String> imageUrls;
  final String sellerId;
  final String sellerName;
  final String? sellerAvatarUrl;
  final String location;
  final double? latitude;
  final double? longitude;
  final bool isActive;
  final bool isFavorite;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final Map<String, dynamic>? metadata;

  const ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    this.price,
    required this.imageUrls,
    required this.sellerId,
    required this.sellerName,
    this.sellerAvatarUrl,
    required this.location,
    this.latitude,
    this.longitude,
    this.isActive = true,
    this.isFavorite = false,
    required this.createdAt,
    this.updatedAt,
    this.metadata,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      category: json['category']?.toString() ?? '',
      price: json['price']?.toDouble(),
      imageUrls: List<String>.from(json['image_urls'] ?? []),
      sellerId: json['seller_id']?.toString() ?? '',
      sellerName: json['seller_name']?.toString() ?? '',
      sellerAvatarUrl: json['seller_avatar_url']?.toString(),
      location: json['location']?.toString() ?? '',
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      isActive: json['is_active'] == true,
      isFavorite: json['is_favorite'] == true,
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at']?.toString() ?? ''),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'image_urls': imageUrls,
      'seller_id': sellerId,
      'seller_name': sellerName,
      'seller_avatar_url': sellerAvatarUrl,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'is_active': isActive,
      'is_favorite': isFavorite,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'metadata': metadata,
    };
  }

  ProductModel copyWith({
    String? id,
    String? title,
    String? description,
    String? category,
    double? price,
    List<String>? imageUrls,
    String? sellerId,
    String? sellerName,
    String? sellerAvatarUrl,
    String? location,
    double? latitude,
    double? longitude,
    bool? isActive,
    bool? isFavorite,
    DateTime? createdAt,
    DateTime? updatedAt,
    Map<String, dynamic>? metadata,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      imageUrls: imageUrls ?? this.imageUrls,
      sellerId: sellerId ?? this.sellerId,
      sellerName: sellerName ?? this.sellerName,
      sellerAvatarUrl: sellerAvatarUrl ?? this.sellerAvatarUrl,
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isActive: isActive ?? this.isActive,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      metadata: metadata ?? this.metadata,
    );
  }

  bool get isFree => price == null || price == 0.0;

  String get formattedPrice {
    if (isFree) return 'Free';
    if (price == null) return '';
    return '\$${price!.toStringAsFixed(2)}';
  }

  String get primaryImageUrl => imageUrls.isNotEmpty ? imageUrls.first : '';

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProductModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}