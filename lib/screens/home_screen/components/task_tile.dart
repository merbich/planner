// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:planner/blocs/bloc_exports.dart';
import 'package:planner/blocs/edit_task/bloc/edit_task_bloc_bloc.dart';
import 'package:planner/screens/edit_task/edit_task.dart';
import 'package:planner/task_repository/lib/task_repository.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
              builder: (context) => Provider<EditTaskBloc>(
                  create: (context) =>
                      EditTaskBloc(postRepository: FirebasePostRepository()),
                  builder: (context, child) {
                    return EditTaskScreen(widget.task);
                  })),
        );
      },
      title: Text(
        widget.task.title,
        style: TextStyle(
          decoration: widget.task.isDone! ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(widget.task.description),

      trailing: Provider<EditTaskBloc>(
          create: (context) =>
              EditTaskBloc(postRepository: FirebasePostRepository()),
          builder: (context, child) {
            return TaskCheckbox(task: widget.task);
          }),
      //onLongPress: () => context.read<TasksBloc>().add(DeleteTask(task: task)),
    );
  }
}

class TaskCheckbox extends StatefulWidget {
  const TaskCheckbox({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  State<TaskCheckbox> createState() => _TaskCheckboxState();
}

class _TaskCheckboxState extends State<TaskCheckbox> {
  bool? isTaskDone = false;
 @override
  void initState() {
    isTaskDone = widget.task.isDone;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<EditTaskBloc, EditTaskState>(
      listener: (context, state) {
        if(state is EditTaskSuccess) {
          setState(() {
            isTaskDone = !widget.task.isDone!;
          });
          
        }
        },
        child: Checkbox(
        value: widget.task.isDone,
        onChanged: (value) {
          Task updatedTask = Task.empty;
          if (value == true) {
            updatedTask = widget.task.copyWith(isDone: true);
          } else {
            updatedTask = widget.task.copyWith(isDone: false);
          }
          context.read<EditTaskBloc>().add(EditTask(updatedTask));
        },
      )
      
      
    );
  }
}
