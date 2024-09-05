import 'package:flutter/material.dart';
import 'package:flutter_app_todo/data/data.dart';
import 'package:flutter_app_todo/providers/providers.dart';
import 'package:flutter_app_todo/utils/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppAlerts {
  AppAlerts._();

  static displaySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: context.textTheme.bodyLarge
              ?.copyWith(color: context.colorScheme.surface),
        ),
        backgroundColor: context.colorScheme.primary,
      ),
    );
  }

  static Future<void> displayDeleteAlertDialog(
    BuildContext context,
    WidgetRef ref,
    Task task,
  ) async {
    Widget cancelButton = TextButton(
      onPressed: () => context.pop(),
      child: const Text('NO'),
    );
    Widget deleteButton = TextButton(
      onPressed: () async {
        await ref.read(taskProvider.notifier).deleteTask(task).then((value) {
          AppAlerts.displaySnackBar(context, 'Task delete successful');
          context.pop();
        });
      },
      child: const Text('YES'),
    );
    AlertDialog alert = AlertDialog(
      title: const Text('ARE YOU SURE YOU WANT TO DELETE THIS TASK?'),
      actions: [
        cancelButton,
        deleteButton,
      ],
    );
    await showDialog(
        context: context,
        builder: (ctx) {
          return alert;
        });
  }
}
