import 'package:planner/user_repository/lib/user_repository.dart';

import '../../task_repository.dart';

class Task{
  String taskId;
  String description;
  DateTime taskDeadline;
  String title;
  bool? isDone;
  bool? isDaily;
  String category;
  MyUser myUser;

  Task({
    required this.taskId,
    required this.title,
    required this.description,
    required this.taskDeadline,
    this.isDone,
    this.isDaily,
    required this.myUser,
    required this.category,
  }){
    isDone = isDone ?? false;
    isDaily = isDaily ?? false;
  }

  static final empty = Task(
    taskId: '',
    description: '',
    taskDeadline: DateTime.now(),
    title: '',
    category: '',
    myUser: MyUser.empty,
  );

  Task copyWith({
    String? taskId,
    String? title,
    String? description,
    DateTime? taskDeadline,
    bool? isDone,
    bool? isDaily,
    String? category,
    MyUser? myUser,
  }) {
    return Task(
     taskId: taskId ?? this.taskId,
     title: title ?? this.title,
     description: description ?? this.description,
     category: category ?? this.category,
     taskDeadline: taskDeadline ?? this.taskDeadline,
     isDone: isDone ?? this.isDone,
     isDaily: isDaily ?? this.isDaily,
     myUser: myUser ?? this.myUser,
     );
  }

  bool get isEmpty => this == Task.empty;
  bool get isNotEmpty => this != Task.empty;

  TaskEntity toEntity()
  {
    return TaskEntity(
      taskId: taskId,
      description: description,
      taskDeadline: taskDeadline,
      isDone : isDone,
      isDaily : isDaily,
      title : title,
      category : category,
      myUser: myUser,
    );
  }
  static Task fromEntity(TaskEntity entity)
  {
    return Task(
      taskId: entity.taskId,
      description: entity.description,
      taskDeadline: entity.taskDeadline,
      isDone : entity.isDone,
      isDaily : entity.isDaily,
      title : entity.title,
      category : entity.category,
      myUser: entity.myUser,
    );
  }
}