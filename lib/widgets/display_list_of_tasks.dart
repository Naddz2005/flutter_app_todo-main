import 'package:flutter/material.dart';
import 'package:flutter_app_todo/data/data.dart';
import 'package:flutter_app_todo/providers/providers.dart';
import 'package:flutter_app_todo/utils/utils.dart';
import 'package:flutter_app_todo/widgets/task_details.dart';
import 'package:flutter_app_todo/widgets/task_title.dart';
import 'common_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DisplayListOfTasks extends ConsumerWidget {
  const DisplayListOfTasks(
      {super.key, required this.tasks, this.isCompletedTasks = false});
  final List<Task> tasks;
  final bool isCompletedTasks;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTasksMessage = isCompletedTasks
        ? 'There is not complete tasks yet'
        : 'There is not task todo!';
    return CommonComtainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyTasksMessage,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return InkWell(
                  onLongPress: () {
                    AppAlerts.displayDeleteAlertDialog(context, ref, task);
                  },
                  onTap: () async {
                    await showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return TaskDetails(task: task);
                        });
                  },
                  child: TaskTitle(
                    task: task,
                    onComplete: (value) async {
                      await ref
                          .read(taskProvider.notifier)
                          .updateTask(task)
                          .then((value) {
                        AppAlerts.displaySnackBar(
                            context,
                            task.isCompleted
                                ? 'Task incompleted'
                                : 'Task completed');
                      });
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1.5,
                );
              },
            ),
    );
  }
}
