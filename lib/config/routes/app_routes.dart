import 'package:flutter/material.dart';
import 'package:flutter_app_todo/screens/screens.dart';
import 'package:go_router/go_router.dart';
import 'routes_location.dart';

final navigationKey = GlobalKey<NavigatorState>();
final appRoutes = [
  GoRoute(
    path: RoutesLocation.home,
    parentNavigatorKey: navigationKey,
    builder: HomeScreen.builder,
  ),
  GoRoute(
    path: RoutesLocation.createTask,
    parentNavigatorKey: navigationKey,
    builder: CreateTaskScreen.builder,
  ),
];
