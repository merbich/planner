part of 'create_task_bloc.dart';

sealed class CreateTaskEvent extends Equatable {
  const CreateTaskEvent();

  @override
  List<Object> get props => [];
}

class CreateTask extends CreateTaskEvent {
	final Task task;

	const CreateTask(this.task);
}
