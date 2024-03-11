import '../../data/repositories/todo_repository.dart';

class DeleteTodo {
  final TodoRepository repository;

  DeleteTodo({required this.repository});

  Future<void> call(String todoId) async {
    return repository.deleteTodo(todoId);
  }
}