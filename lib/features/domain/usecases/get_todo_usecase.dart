import 'package:clean_arch_app/features/data/repositories/todo_repository.dart';
import 'package:clean_arch_app/features/domain/entities/todo.dart';

class GetTodoList {
  final TodoRepository repository;

  GetTodoList({required this.repository});

  Future<List<Todo>> call() async {
    return repository.getTodoList();
  }
}
