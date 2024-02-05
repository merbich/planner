import 'package:equatable/equatable.dart';
import 'package:planner/entities/task_entity.dart';

class Task{
  String taskId;
  String description;
  DateTime taskDeadline;
  final String title;
  bool? isDone;
  bool? isDaily;
  Category category;

  Task({
    required this.taskId,
    required this.title,
    required this.description,
    required this.taskDeadline,
    this.isDone,
    this.isDaily,
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
    category: Category.dailyTask,
  );

  Task copyWith({
    String? taskId,
    String? title,
    String? description,
    DateTime? taskDeadline,
    bool? isDone,
    bool? isDaily,
    Category? category,
  }) {
    return Task(
     taskId: taskId ?? this.taskId,
     title: title ?? this.title,
     description: description ?? this.description,
     category: category ?? this.category,
     taskDeadline: taskDeadline ?? this.taskDeadline,
     isDone: isDone ?? this.isDone,
     isDaily: isDaily ?? this.isDaily,
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
    );
  }
}
enum Category
{
  dailyHabit,
  lecture,
  event,
  dailyTask,
  studyTask
}