import 'package:planner/task_repository/lib/task_repository.dart';

abstract class TaskRepository {
  Future<Task> createPost(Task post);

	Future<List<Task>> getPost();

  Future<Task> editTask(Task task);
}