import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_todo/app/todo_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  runApp(
    const ProviderScope(
      child: ToDoApp(),
    ),
  );
}
