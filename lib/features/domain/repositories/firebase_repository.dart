import 'package:clean_arch_app/features/domain/entities/task_entity.dart';

abstract class FirebaseRepository{
Future<void> addTodoItem(TaskEntity taskEntity);
Future<void> removeTodoItem(String id);
Stream<List<TaskEntity>> getTodoList();
}