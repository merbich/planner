import 'package:equatable/equatable.dart';

class Task extends Equatable{
  final String title;
  bool? isDone;
  bool? isDeleted;
  Category category;

  Task({
    required this.title,
    this.isDone,
    this.isDeleted,
    required this.category,
  }){
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({
    String? title,
    bool? isDone,
    bool? isDeleted,
    Category? category,
  }) {
    return Task(
     title: title ?? this.title,
     category: category ?? this.category,
     isDone: isDone ?? this.isDone,
     isDeleted: isDeleted ?? this.isDeleted,
     );
  }
  Map<String, dynamic> toMap()
  {
    return {
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'Category': Category,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
      category: map['Category'],
    );
  }
  
  @override
  List<Object?> get props => [
    title, isDone, isDeleted, category
  ];
}
enum Category
{
  dailyHabit,
  lecture,
  event,
  dailyTask,
  studyTask
}