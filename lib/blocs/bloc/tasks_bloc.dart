import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:planner/blocs/bloc_exports.dart';
import 'package:planner/task_repository/lib/task_repository.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
      on<AddTask>(_onAddTask);
      on<UpdateTask>(_onUpdateTask);
      on<DeleteTask>(_onDeleteTask);
    }
  

  void _onAddTask(AddTask event, Emitter<TasksState> emit)
  {
    final state = this.state;
    emit(TasksState(
      allTasks: List.from(state.allTasks)..add(event.task),
    ));
  }
  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit)
  {
    final state = this.state;
    final task = event.task;

    final int index = state.allTasks.indexOf(task);

    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
    ? allTasks.insert(index, task.copyWith(isDone: true))
    : allTasks.insert(index, task.copyWith(isDone: false));

    emit(TasksState(allTasks: allTasks));
  }
  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit)
  {
    final state = this.state;
    final task = event.task;

    emit(TasksState(allTasks: List.from(state.allTasks)..remove(task)));
  }
  
  /*@override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }*/
}
