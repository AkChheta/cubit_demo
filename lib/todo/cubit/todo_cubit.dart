import 'package:blocdemo/repository/todo_repository.dart';
import 'package:blocdemo/todo/cubit/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository _repository;
  TodoCubit(this._repository) : super(InitTodoState());

  Future<void> fetchTodo() async {
    emit(LoadingTodoState());
    try {
      final response = await _repository.getAll();
      emit(ResposeTodoState(response));
    } catch (e) {
      emit(ErrorTodoState(e.toString()));
    }
  }
}
