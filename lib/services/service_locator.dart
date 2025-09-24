import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

// Services
import 'user_service.dart';
import 'product_service.dart';
import 'chat_service.dart';
import 'location_service.dart';
import 'payment_service.dart';
import 'notification_service.dart';
import 'file_service.dart';
import 'delivery_service.dart';

// BLoCs
import '../blocs/auth/auth_bloc.dart';
import '../blocs/products/products_bloc.dart';
import '../blocs/chats/chats_bloc.dart';
import '../blocs/profile/profile_bloc.dart';

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  ServiceLocator._();

  static Future<void> setup() async {
    // Register Services
    serviceLocator.registerLazySingleton<UserService>(() => UserService());
    serviceLocator.registerLazySingleton<ProductService>(() => ProductService());
    serviceLocator.registerLazySingleton<ChatService>(() => ChatService());
    serviceLocator.registerLazySingleton<LocationService>(() => LocationService());
    serviceLocator.registerLazySingleton<PaymentService>(() => PaymentService());
    serviceLocator.registerLazySingleton<NotificationService>(() => NotificationService());
    serviceLocator.registerLazySingleton<FileService>(() => FileService());
    serviceLocator.registerLazySingleton<DeliveryService>(() => DeliveryService());

    // Register BLoCs
    serviceLocator.registerFactory<AuthBloc>(
      () => AuthBloc(userService: serviceLocator<UserService>()),
    );

    serviceLocator.registerFactory<ProductsBloc>(
      () => ProductsBloc(
        productService: serviceLocator<ProductService>(),
        locationService: serviceLocator<LocationService>(),
      ),
    );

    serviceLocator.registerFactory<ChatsBloc>(
      () => ChatsBloc(chatService: serviceLocator<ChatService>()),
    );

    serviceLocator.registerFactory<ProfileBloc>(
      () => ProfileBloc(
        userService: serviceLocator<UserService>(),
        fileService: serviceLocator<FileService>(),
      ),
    );
  }

  static List<BlocProvider> getBlocProviders() {
    return [
      BlocProvider<AuthBloc>(create: (_) => serviceLocator<AuthBloc>()),
      BlocProvider<ProductsBloc>(create: (_) => serviceLocator<ProductsBloc>()),
      BlocProvider<ChatsBloc>(create: (_) => serviceLocator<ChatsBloc>()),
      BlocProvider<ProfileBloc>(create: (_) => serviceLocator<ProfileBloc>()),
    ];
  }

  static T get<T extends Object>() => serviceLocator.get<T>();

  static void dispose() {
    serviceLocator.reset();
  }
}

// Extension methods for easy access
extension ServiceLocatorExtension on Object {
  T getService<T extends Object>() => ServiceLocator.get<T>();
}