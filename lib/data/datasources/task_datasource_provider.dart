import 'package:flutter_app_todo/data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskDatasourceProvider = Provider<TaskDatasource>((ref) {
  return TaskDatasource();
});
