import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../services/product_service.dart';
import '../../services/location_service.dart';
import '../../models/product_model.dart';

// Events
abstract class ProductsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductsLoadRequested extends ProductsEvent {
  final String? category;
  final bool refresh;

  ProductsLoadRequested({this.category, this.refresh = false});

  @override
  List<Object?> get props => [category, refresh];
}

// States
abstract class ProductsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductModel> products;
  final String? selectedCategory;

  ProductsLoaded({required this.products, this.selectedCategory});

  @override
  List<Object?> get props => [products, selectedCategory];
}

class ProductsError extends ProductsState {
  final String message;

  ProductsError({required this.message});

  @override
  List<Object> get props => [message];
}

// BLoC
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductService productService;
  final LocationService locationService;

  ProductsBloc({
    required this.productService,
    required this.locationService,
  }) : super(ProductsInitial()) {
    on<ProductsLoadRequested>(_onProductsLoadRequested);
  }

  Future<void> _onProductsLoadRequested(
    ProductsLoadRequested event,
    Emitter<ProductsState> emit,
  ) async {
    if (!event.refresh && state is ProductsLoading) return;

    emit(ProductsLoading());

    try {
      final response = await productService.getProducts(
        category: event.category,
      );

      if (response.success && response.data != null) {
        emit(ProductsLoaded(
          products: response.data!,
          selectedCategory: event.category,
        ));
      } else {
        emit(ProductsError(message: response.message ?? 'Failed to load products'));
      }
    } catch (e) {
      emit(ProductsError(message: e.toString()));
    }
  }
}