import 'package:flutter/material.dart';
import 'package:planner/consts/colors_constants.dart';
import 'package:planner/screens/home_screen/components/task_tile.dart';
import 'package:planner/task_repository/lib/task_repository.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Center(child: Text("Daily tasks:"),),
          Expanded(
            child: ListView.builder(
              itemCount: taskList.where((task) => task.category == "daily task").length,
              itemBuilder: (context, index) {
                var eventTasks = taskList.where((task) => task.category == "daily task").toList();
                var task = eventTasks[index];
                return TaskTile(task: task);
              },
            ),
          ),
          Center(child: Text("Study tasks"),),
          Expanded(
            child: ListView.builder(
              itemCount: taskList.where((task) => task.category == "study task").length,
              itemBuilder: (context, index) {
                var eventTasks = taskList.where((task) => task.category == "study task").toList();
                var task = eventTasks[index];
                return TaskTile(task: task);
              },
            ),
          ),
          Center(child: Text("Events:"),),
          Expanded(
            child: ListView.builder(
              itemCount: taskList.where((task) => task.category == "event").length,
              itemBuilder: (context, index) {
                var eventTasks = taskList.where((task) => task.category == "event").toList();
                var task = eventTasks[index];
                return TaskTile(task: task);
              },
            ),
          ),
          Center(child: Text("Lectures:"),),
          Expanded(
            child: ListView.builder(
              itemCount: taskList.where((task) => task.category == "lecture").length,
              itemBuilder: (context, index) {
                var eventTasks = taskList.where((task) => task.category == "lecture").toList();
                var task = eventTasks[index];
                return TaskTile(task: task);
              },
            ),
          ),
        ],
      );
    
  }
}
