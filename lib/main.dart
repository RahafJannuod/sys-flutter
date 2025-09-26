import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/routing/app_router.dart';
import 'core/localization/app_localizations.dart';
import 'design_system/themes/app_theme.dart';
import 'services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize service locator
  await ServiceLocator.setup();

  runApp(const CommunityMarketplaceApp());
}

class CommunityMarketplaceApp extends StatelessWidget {
  const CommunityMarketplaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: ServiceLocator.getBlocProviders(),
      child: MaterialApp.router(
        title: 'Community Marketplace',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme, // Use the custom theme
        darkTheme: AppTheme.darkTheme,
        routerConfig: AppRouter.router,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', 'SA'),
        ],
        locale: const Locale('en', 'US'), // Default to English
      ),
    );
  }
}

