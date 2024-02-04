import 'package:flutter/material.dart';
import 'package:planner/models/task.dart';
import 'package:planner/screens/home_screen/components/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index)
        {
          var task = taskList[index];
          return TaskTile(task: task);
        },
        ),
    );
  }
}

