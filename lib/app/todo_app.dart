import 'package:flutter/material.dart';
import 'package:flutter_app_todo/config/config.dart';
import 'package:flutter_app_todo/config/routes/routes.dart';
import 'package:flutter_app_todo/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToDoApp extends ConsumerWidget {
  const ToDoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerConfig = ref.watch(routesProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: routerConfig,
    );
  }
}
