import 'package:equatable/equatable.dart';
import 'package:planner/models/task.dart';

class TaskEntity extends Equatable{
  String taskId;
  String description;
  DateTime taskDeadline;
  final String title;
  bool? isDone;
  bool? isDaily;
  Category category;

  TaskEntity({
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

  Map<String, dynamic> toMap()
  {
    return {
      'taskId' : taskId,
      'title': title,
      'description' : description,
      'taskDeadline' : taskDeadline,
      'isDone': isDone,
      'isDaily': isDaily,
      'Category': Category,
    };
  }

  static TaskEntity fromMap(Map<String, dynamic> map) {
    return TaskEntity(
      taskId: map['taskID'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      isDone: map['isDone'] as bool,
      isDaily: map['isDaily'] as bool,
      category: map['Category'] as Category,
      taskDeadline: DateTime.parse(map['taskDeadline'])
    );
  }

  @override
  List<Object?> get props => [
    title, isDone, isDaily, category, description, taskDeadline, taskId,
  ];

}