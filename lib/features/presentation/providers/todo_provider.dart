
import 'package:flutter/material.dart';

import '../../domain/entities/todo.dart';
import '../../domain/usecases/add_todo_usecase.dart';
import '../../domain/usecases/delete_todo_usecase.dart';
import '../../domain/usecases/get_todo_usecase.dart';
import '../../domain/usecases/update_todo_usecase.dart';

class TodoProvider extends ChangeNotifier {
  final GetTodoList getTodoList;
  final AddTodo addTodo;
  final DeleteTodo deleteTodo;
  final UpdateTodoStatus updateTodoStatus;

  List<Todo> _todos = [];

  TodoProvider({
    required this.getTodoList,
    required this.addTodo,
    required this.deleteTodo,
    required this.updateTodoStatus,
  }) {
    fetchTodos();
  }

  List<Todo> get todos => _todos;

  Future<void> fetchTodos() async {
    _todos = await getTodoList();
    notifyListeners();
  }

  Future<void> addNewTodo(String text) async {
    final newTodo = Todo(
      id: DateTime.now().toString(),
      text: text,
      completed: false,
    );
    await addTodo(newTodo);
    await fetchTodos();
  }

  Future<void> removeTodo(String todoId) async {
    await deleteTodo(todoId);
    await fetchTodos();
  }

  Future<void> toggleTodoStatus(String todoId, bool isCompleted) async {
    await updateTodoStatus(todoId, isCompleted);
    await fetchTodos();
  }
}
