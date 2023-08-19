import 'package:blocdemo/model/todo_model.dart';

abstract class TodoState {}

class InitTodoState extends TodoState {}

class LoadingTodoState extends TodoState {}

class ErrorTodoState extends TodoState {
  final String message;
  ErrorTodoState(this.message);
}

class ResposeTodoState extends TodoState {
  final List<Todo> todos;
  ResposeTodoState(this.todos);
}
