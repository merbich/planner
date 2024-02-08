part of 'edit_task_bloc_bloc.dart';

sealed class EditTaskEvent extends Equatable {
  const EditTaskEvent();

  @override
  List<Object> get props => [];
}

class EditTask extends EditTaskEvent {
	final Task task;

	const EditTask(this.task);
}