import 'package:flutter/material.dart';
import 'package:planner/models/task.dart';

import '../../../blocs/bloc_exports.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(children: [
        const Text('Add Task'),
        const SizedBox(height: 10),
        TextField(
          autofocus: true,
          controller: titleController,
          decoration: const InputDecoration(
            label: Text('Title'),
            border: OutlineInputBorder(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel')),
            ElevatedButton(
                onPressed: () {
                  var task = Task(
                    title: titleController.text,
                    category: Category.dailyHabit,
                  );
                  context.read<TasksBloc>().add(AddTask(task: task));
                  Navigator.pop(context);
                },
                child: const Text('Add')),
          ],
        ),
      ]),
    );
  }
}