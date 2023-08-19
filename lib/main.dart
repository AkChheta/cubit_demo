import 'package:blocdemo/home/cubit/counter_cubit.dart';
import 'package:blocdemo/home/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
    // return BlocProvider(
    //   create: (context) => TodoCubit(TodoRepository()),
    //   child: MaterialApp(
    //     home: TodoPage(),
    //   ),
    // );
  }
}
