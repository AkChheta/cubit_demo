import 'package:blocdemo/todo/cubit/todo_cubit.dart';
import 'package:blocdemo/todo/cubit/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TodoCubit>().fetchTodo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Cubit Api call"),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(builder: (context, state) {
        if (state is InitTodoState || state is LoadingTodoState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ResposeTodoState) {
          final todos = state.todos;
          return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.name.toString()),
                  subtitle: Text(todo.description.toString()),
                );
              });
        } else if (state is ErrorTodoState) {
          return StreamBuilder<Object>(
              stream: null,
              builder: (context, snapshot) {
                return Text(state.message);
              });
        }
        return Center(
          child: Text(state.toString()),
        );
      }),
    );
  }
}
