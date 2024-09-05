import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app_todo/utils/utils.dart';

final categoryProvider = StateProvider.autoDispose<TaskCategories>((ref) {
  return TaskCategories.other;
});
