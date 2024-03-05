import 'package:clean_arch_app/features/domain/entities/task_entity.dart';
import 'package:clean_arch_app/features/domain/repositories/firebase_repository.dart';

import '../remote_data_source/firebase_remote_datasource.dart';

class FirebaseRepositoryImpl implements FirebaseRepository{

  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseRepositoryImpl({required this.remoteDataSource});
  
  @override
  Future<void> addTodoItem(TaskEntity taskEntity)async {
   return await remoteDataSource.addTodoItem(taskEntity);
  }

  @override
  Stream<List<TaskEntity>> getTodoList() {
    return remoteDataSource.getTodoList();
  }

  @override
  Future<void> removeTodoItem(String id) async {
    return await remoteDataSource.removeTodoItem(id);
  }
  
}