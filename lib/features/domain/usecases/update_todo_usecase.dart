import '../../data/repositories/todo_repository.dart';

class UpdateTodoStatus {
  final TodoRepository repository;

  UpdateTodoStatus({required this.repository});

  Future<void> call(String todoId, bool isCompleted) async {
    return repository.updateTodoStatus(todoId, isCompleted);
  }
}