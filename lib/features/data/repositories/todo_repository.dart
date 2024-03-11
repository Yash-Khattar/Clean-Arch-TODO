import 'package:clean_arch_app/features/domain/entities/todo.dart';

import '../datasources/firebase_todo_datasource.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodoList();
  Future<void> addTodo(Todo todo);
  Future<void> deleteTodo(String todoId);
  Future<void> updateTodoStatus(String todoId, bool isCompleted);
}

class TodoRepositoryImpl implements TodoRepository {
  final FirebaseTodoDataSource dataSource;

  TodoRepositoryImpl({required this.dataSource});

  @override
  Future<List<Todo>> getTodoList() async {
    return dataSource.getTodos();
  }

  @override
  Future<void> addTodo(Todo todo) async {
    return dataSource.addTodo(todo);
  }

  @override
  Future<void> deleteTodo(String todoId) async {
    return dataSource.deleteTodo(todoId);
  }

  @override
  Future<void> updateTodoStatus(String todoId, bool isCompleted) async {
    return dataSource.updateTodoStatus(todoId, isCompleted);
  }
}
