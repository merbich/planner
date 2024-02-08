part of 'get_task_bloc.dart';

sealed class GetTaskEvent extends Equatable {
  const GetTaskEvent();

  @override
  List<Object> get props => [];
}

class GetTasks extends GetTaskEvent{

}
