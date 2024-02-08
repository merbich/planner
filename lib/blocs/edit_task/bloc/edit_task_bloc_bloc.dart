import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:planner/task_repository/lib/task_repository.dart';

part 'edit_task_bloc_event.dart';
part 'edit_task_bloc_state.dart';

class EditTaskBloc extends Bloc<EditTaskEvent, EditTaskState> {
	TaskRepository _postRepository;

  EditTaskBloc({
		required TaskRepository postRepository
	}) : _postRepository = postRepository,
		super(EditTaskInitial()) {
    on<EditTask>((event, emit) async {
			emit(EditTaskLoading());
      try {
				Task post = await _postRepository.editTask(event.task);
        emit(EditTaskSuccess(post));
      } catch (e) {
        emit(EditTaskFailure());
      }
    });
  }
}
