// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:planner/blocs/bloc_exports.dart';
import 'package:planner/blocs/create_task/bloc/create_task_bloc.dart';
import 'package:planner/blocs/edit_task/bloc/edit_task_bloc_bloc.dart';
import 'package:planner/consts/colors_constants.dart';
import 'package:planner/screens/sign_in_screen/components/background.dart';
import 'package:planner/screens/sign_in_screen/components/rounded_input_field.dart';
import 'package:planner/task_repository/lib/task_repository.dart';
import 'package:planner/user_repository/lib/user_repository.dart';
import 'package:planner/task_repository/lib/src/models/Task.dart';

class EditTaskScreen extends StatefulWidget {
  final Task task;
  EditTaskScreen(
    this.task, {
    Key? key,
  }) : super(key: key);

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late Task updatedTask;
  final taskTitleController = TextEditingController();
  final taskDescriptionController = TextEditingController();
  String selectedCategory = 'daily task';
  DateTime selectedDate = DateTime.now();
  List<String> categories = [
    'daily habit',
    'lecture',
    'event',
    'daily task',
    'study task'
  ];

  @override
  void initState() {
    updatedTask = Task.empty;
    taskTitleController.text = widget.task.title;
    taskDescriptionController.text = widget.task.description;
    selectedCategory = widget.task.category;
    selectedDate = widget.task.taskDeadline;
    super.initState();
  }

  Future<void> selectDateFunc(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return BlocListener<EditTaskBloc, EditTaskState>(
      listener: (context, state) {
        if(state is EditTaskSuccess) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: kPrimaryLightCorol,
        body: Background(
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedInputField(
                hintText: "Title",
                onChanged: (value) {},
                controller: taskTitleController,
                icon: Icons.task,
              ),
              RoundedInputField(
                hintText: "Description",
                onChanged: (value) {},
                controller: taskDescriptionController,
                icon: Icons.description,
              ),
              InkWell(
                onTap: () => selectDateFunc(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.calendar_today),
                    SizedBox(width: 8),
                    Text(
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              DropdownButton<String>(
                value: selectedCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue!;
                  });
                },
                items: categories.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel')),
                  ElevatedButton(
                    onPressed: () {
                      if (taskTitleController.text != '') {
                        setState(() {
                          updatedTask.taskId = widget.task.taskId;
                          updatedTask.title = taskTitleController.text;
                          updatedTask.description = taskDescriptionController.text;
                          updatedTask.taskDeadline = selectedDate;
                          updatedTask.category = selectedCategory;
                          updatedTask.isDone = widget.task.isDone;
                          updatedTask.isDaily = widget.task.isDaily;
                        });
                        log(updatedTask.toString());
                        context.read<EditTaskBloc>().add(EditTask(updatedTask));
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
