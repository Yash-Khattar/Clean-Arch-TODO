import 'package:clean_arch_app/features/domain/entities/task_entity.dart';
import 'package:clean_arch_app/features/domain/repositories/firebase_repository.dart';
import 'package:clean_arch_app/features/presentation/widgets/task.dart';

class AddTodoUsercase{
  final FirebaseRepository repository;

AddTodoUsercase({required this.repository});

Future<void> addTodoItem(TaskEntity taskEntity) => repository.addTodoItem(taskEntity);
}