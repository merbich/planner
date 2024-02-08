import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planner/blocs/bloc/get_task/bloc/get_task_bloc.dart';
import 'package:planner/blocs/create_task/bloc/create_task_bloc.dart';
import 'package:planner/blocs/user/bloc/my_user_bloc.dart';
import 'package:planner/consts/colors_constants.dart';
import 'package:planner/screens/add_task_screen/add_task_screen.dart';
import 'package:planner/screens/drawer/drawer_file.dart';
import 'package:planner/screens/home_screen/components/tasks_list.dart';
import 'package:planner/screens/sign_in_screen/components/background.dart';
import 'package:planner/task_repository/lib/src/firebase_task_repository.dart';
import 'package:provider/provider.dart';

import '../../blocs/bloc_exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyUserBloc, MyUserState>(builder: (context, state) {
      //if (state.status == MyUserStatus.success) {
      return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          drawer: const CustomDrawer(),
          appBar: AppBar(
            backgroundColor: kSecondaryColor,
            centerTitle: true,
            title: const Text(
              'Plan for today:',
              style: TextStyle(
                fontSize: 24.0,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                
              ),
            ),
          ),
          body: Background(
            
            child: BlocBuilder<GetTaskBloc, GetTaskState>(
              builder: (context, state) {
                if(state is GetTaskSuccess){
                  return TasksList(taskList: state.tasks);
                
                }
                else if(state is GetTaskLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else {
                  return const Center(
                    child: Text("An error has occured"),
                  );
                }
              },
            ),
          ),
          floatingActionButton:
              //BlocBuilder<MyUserBloc, MyUserState>(builder: (context, state) {
              state.status == MyUserStatus.success
                  ? FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                              builder: (context) => Provider<CreateTaskBloc>(
                                  create: (context) => CreateTaskBloc(
                                      postRepository: FirebasePostRepository()),
                                  builder: (context, child) {
                                    return AddTaskScreen(
                                      state.user!,
                                    );
                                  })),
                        );
                      },
                      tooltip: 'Add Task',
                      child: const Icon(Icons.add),
                    )
                  : const FloatingActionButton(
                      onPressed: null,
                      tooltip: 'Add Task',
                      child: Icon(Icons.add),
                    )
          //}
          //}
          //)
          ); //}
      //else {
      //  throw Exception();
      //}
    });
  }
}
