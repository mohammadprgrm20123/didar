import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/di/injection.dart';
import 'core/utils/theme_constants.dart';
import 'presentation/customer/list/view/customer_list_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) => GetMaterialApp(
      title: 'Didar',
      debugShowCheckedModeBanner: false,
      builder: (final c, final child) =>
          Directionality(textDirection: TextDirection.rtl, child: child!),
      theme: FlexThemeData.light(
        tabBarStyle: FlexTabBarStyle.forBackground,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 57,
            color: Colors.white,
          ),
          displayMedium: TextStyle(
            fontSize: 45,
            color: Colors.white,
          ),
          displaySmall: TextStyle(
            fontSize: 36,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
          headlineLarge: TextStyle(
            fontSize: 32,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
          headlineMedium: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
          headlineSmall: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
          titleLarge: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
          titleMedium: TextStyle(
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w400),
          titleSmall: TextStyle(
            fontSize: 18,
            letterSpacing: 0.1,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            letterSpacing: 0.1,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
          labelMedium: TextStyle(
            fontSize: 12,
            letterSpacing: 0.5,
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
          ),
          labelSmall: TextStyle(
            fontSize: 11,
            letterSpacing: 0.5,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            letterSpacing: 0.15,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            letterSpacing: 0.25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            letterSpacing: 0.4,
            overflow: TextOverflow.ellipsis,
            color: Colors.white,
          ),
        ),
        primaryTextTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 57,
            color: Colors.white,
          ),
          displayMedium: TextStyle(
            fontSize: 45,
            color: Colors.white,
          ),
          displaySmall: TextStyle(
            fontSize: 36,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
          headlineLarge: TextStyle(
            fontSize: 32,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
          headlineMedium: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
          headlineSmall: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
          titleLarge: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
          titleMedium: TextStyle(
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w400),
          titleSmall: TextStyle(
            fontSize: 14,
            letterSpacing: 0.1,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            letterSpacing: 0.1,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
          labelMedium: TextStyle(
            fontSize: 12,
            letterSpacing: 0.5,
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
          ),
          labelSmall: TextStyle(
            fontSize: 11,
            letterSpacing: 0.5,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            letterSpacing: 0.15,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            letterSpacing: 0.25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            letterSpacing: 0.4,
            overflow: TextOverflow.ellipsis,
            color: Colors.white,
          ),
        ),
        appBarStyle: FlexAppBarStyle.primary,
        scheme: FlexScheme.outerSpace,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          useTextTheme: false,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: false,
        fontFamily: ThemeConstants.fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.hippieBlue,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useTextTheme: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: false,
      ),
      home: const CustomerListScreen());
}
