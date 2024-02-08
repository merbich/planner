import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:planner/task_repository/lib/task_repository.dart';

part 'create_task_event.dart';
part 'create_task_state.dart';

class CreateTaskBloc extends Bloc<CreateTaskEvent, CreateTaskState> {
	TaskRepository _postRepository;

  CreateTaskBloc({
		required TaskRepository postRepository
	}) : _postRepository = postRepository,
		super(CreateTaskInitial()) {
    on<CreateTask>((event, emit) async {
			emit(CreateTaskLoading());
      try {
				Task post = await _postRepository.createPost(event.task);
        emit(CreateTaskSuccess(post));
      } catch (e) {
        emit(CreateTaskFailure());
      }
    });
  }
}
