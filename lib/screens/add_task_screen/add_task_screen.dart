import 'package:flutter/material.dart';
import 'package:planner/blocs/bloc_exports.dart';
import 'package:planner/consts/colors_constants.dart';
import 'package:planner/models/task.dart';
import 'package:planner/screens/sign_in_screen/components/background.dart';
import 'package:planner/screens/sign_in_screen/components/rounded_input_field.dart';
import 'package:planner/screens/welcome_screen/components/body.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final taskTitleController = TextEditingController();
  String selectedCategory = 'dailyHabit'; // Default category
  List<String> categories = ['dailyHabit','lecture','event','dailyTask','studyTask'];

  Category stringToTaskCategory(String value) {
    String lowercaseValue = value.toLowerCase();
    Category? category = Category.values
        .firstWhere((e) => e.toString().toLowerCase() == lowercaseValue);
    return category;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                        var task = Task(
                          title: taskTitleController.text,
                          category: Category.values.firstWhere((e) => e.toString() == 'Category.$selectedCategory'),
                        );
                        context.read<TasksBloc>().add(AddTask(task: task));
                        Navigator.pop(context);
                      },
                      child: const Text('Add'),
                      ),
                ],
              ),
            ],
          )
          ),
        ),
        );
  }
}
