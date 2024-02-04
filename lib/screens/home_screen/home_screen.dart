import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:planner/models/task.dart';
import 'package:planner/screens/drawer/drawer_file.dart';
import 'package:planner/screens/home_screen/components/add_task_screen.dart';
import 'package:planner/screens/home_screen/components/tasks_list.dart';

import '../../blocs/bloc_exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final user = FirebaseAuth.instance.currentUser!;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: AddTaskScreen(),
            ));
  }


  @override
  Widget build(BuildContext context) {
    //List<Task> taskList = state.allTasks;
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.allTasks;
        return Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: const Text(''),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TasksList(taskList: taskList),
              const SignOutButton(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
