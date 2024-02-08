part of 'edit_task_bloc_bloc.dart';

sealed class EditTaskState extends Equatable {
  const EditTaskState();
  
  @override
  List<Object> get props => [];
}

final class EditTaskInitial extends EditTaskState {}

final class EditTaskFailure extends EditTaskState {}
final class EditTaskLoading extends EditTaskState {}
final class EditTaskSuccess extends EditTaskState {
	final Task task;

	const EditTaskSuccess(this.task);
}
