import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:planner/task_repository/lib/task_repository.dart';

part 'get_task_event.dart';
part 'get_task_state.dart';

class GetTaskBloc extends Bloc<GetTaskEvent, GetTaskState> {
	TaskRepository _postRepository;

  GetTaskBloc({
		required TaskRepository postRepository
	}) : _postRepository = postRepository,
		super(GetTaskInitial()) {
    on<GetTasks>((event, emit) async {
			emit(GetTaskLoading());
      try {
				List<Task> posts = await _postRepository.getPost();
        emit(GetTaskSuccess(posts));
      } catch (e) {
        emit(GetTaskFailure());
      }
    });
  }
}