part of 'create_task_bloc.dart';

sealed class CreateTaskState extends Equatable {
  const CreateTaskState();
  
  @override
  List<Object> get props => [];
}

final class CreateTaskInitial extends CreateTaskState {}

final class CreateTaskFailure extends CreateTaskState {}
final class CreateTaskLoading extends CreateTaskState {}
final class CreateTaskSuccess extends CreateTaskState {
	final Task task;

	const CreateTaskSuccess(this.task);
}
