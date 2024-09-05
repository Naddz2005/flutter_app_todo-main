import 'package:flutter/material.dart';
import 'package:flutter_app_todo/utils/extensions.dart';
import 'package:flutter_app_todo/widgets/circle_container.dart';
import 'package:gap/gap.dart';
import '../data/models/task.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({super.key, required this.task, this.onComplete});
  final Task task;
  final Function(bool?)? onComplete;
  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    final double iconOpacity = task.isCompleted ? 0.3 : 0.4;
    final backgroundOpacity = task.isCompleted ? 0.1 : 0.3;
    final FontWeight fontWeight =
        task.isCompleted ? FontWeight.normal : FontWeight.bold;
    final TextDecoration textDecoration =
        task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        top: 10,
        bottom: 10,
      ),
      child: Row(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(backgroundOpacity),
            child: Center(
              child: Icon(
                task.category.icon,
                color: task.category.color.withOpacity(iconOpacity),
              ),
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: style.titleMedium?.copyWith(
                    decoration: textDecoration,
                    fontSize: 20,
                    fontWeight: fontWeight,
                  ),
                ),
                Text(
                  task.time,
                  style: style.titleMedium?.copyWith(
                    decoration: textDecoration,
                  ),
                ),
              ],
            ),
          ),
          Checkbox(
            value: task.isCompleted,
            onChanged: onComplete,
          )
        ],
      ),
    );
  }
}
