import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_itti/core/dependency_injection/locator.dart';
import 'package:prueba_itti/core/router/router.dart';
import 'package:prueba_itti/core/theme/app.theme.dart';

import 'presentation/controllers/settings_view_controller.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
  setupLocator();
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      themeMode: appTheme.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      title: 'Itti App',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
    );
  }
}
