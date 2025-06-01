import 'package:flutter/material.dart';
import 'todo.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Todo App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const TodoList(),
    );
  }
}
