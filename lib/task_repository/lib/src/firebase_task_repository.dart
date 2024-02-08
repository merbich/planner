import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planner/task_repository/lib/task_repository.dart';
import 'package:uuid/uuid.dart';

import 'task_repo.dart';

class FirebasePostRepository implements TaskRepository {

	final postCollection = FirebaseFirestore.instance.collection('tasks');

  @override
  Future<Task> createPost(Task post) async {
    try {
			post.taskId = const Uuid().v1();

      await postCollection
				.doc(post.taskId)
				.set(post.toEntity().toMap());

			return post;
    } catch (e) {
      log(e.toString());
			rethrow;
    }
  }

  @override
  Future<List<Task>> getPost() {
    try {
      return postCollection
				.get()
				.then((value) => value.docs.map((e) => 
					Task.fromEntity(TaskEntity.fromMap(e.data()))
				).toList());
    } catch (e) {
      log(e.toString());
			rethrow;
    }
  }
  
  @override
  Future<Task> editTask(Task task) async {
    try {
      await postCollection
				.doc(task.taskId)
				.update(task.toEntity().toMap());

			return task;
    } catch (e) {
      log(e.toString());
			rethrow;
    }
  }


}
  
