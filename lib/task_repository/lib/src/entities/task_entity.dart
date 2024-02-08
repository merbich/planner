import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:planner/user_repository/lib/user_repository.dart';

// ignore: must_be_immutable
class TaskEntity extends Equatable{
  String taskId;
  String description;
  DateTime taskDeadline;
  String title;
  bool? isDone;
  bool? isDaily;
  String category;
  MyUser myUser;

  TaskEntity({
    required this.taskId,
    required this.title,
    required this.description,
    required this.taskDeadline,
    this.isDone,
    this.isDaily,
    required this.category,
    required this.myUser,
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
      //'Category': Category,
      'Category': category,
      'myUser' : myUser.toEntity().toDocument(),
    };
  }

  static TaskEntity fromMap(Map<String, dynamic> map) {
    return TaskEntity(
      taskId: map['taskId'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      isDone: map['isDone'] as bool,
      isDaily: map['isDaily'] as bool,
      category: map['Category'] as String,
      taskDeadline: (map['taskDeadline'] as Timestamp).toDate(),
      myUser: MyUser.fromEntity(MyUserEntity.fromDocument(map['myUser'])),
    );
  }

  @override
  List<Object?> get props => [
    title, isDone, isDaily, category, description, taskDeadline, taskId, myUser
  ];

}