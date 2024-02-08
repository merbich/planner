part of 'get_task_bloc.dart';

sealed class GetTaskState extends Equatable {
  const GetTaskState();
  
  @override
  List<Object> get props => [];
}

final class GetTaskInitial extends GetTaskState {}

final class GetTaskFailure extends GetTaskState {}
final class GetTaskLoading extends GetTaskState {}
final class GetTaskSuccess extends GetTaskState {
	final List<Task> tasks;

	const GetTaskSuccess(this.tasks);
}
