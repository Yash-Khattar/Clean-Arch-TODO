import 'package:clean_arch_app/features/data/remote_data_source/models/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/task_entity.dart';
import 'firebase_remote_datasource.dart';

class FirebaseRemoteDataSourceImpl extends FirebaseRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  FirebaseRemoteDataSourceImpl({required this.firebaseFirestore});

  // @override
  // Future<void> addTask(TaskEntity task) async {
  //   try {
  //     await firebaseFirestore.collection('tasks').add(task.toJson());
  //   } on FirebaseException catch (e) {
  //    throw Exception( e.message);
  //   }
  // }

  // @override
  // Future<void> deleteTask(TaskEntity task) async {
  //   try {
  //     await firebaseFirestore.collection('tasks').doc(task.id).delete();
  //   } on FirebaseException catch (e) {
  //     throw Exception( e.message);
  //   }
  // }

  // @override
  // Future<List<TaskEntity>> getTasks() async {
  //   try {
  //     final querySnapshot = await firebaseFirestore.collection('tasks').get();
  //     return querySnapshot.docs
  //         .map((doc) => TaskEntity.fromJson(doc.data() as Map<String, dynamic>))
  //         .toList();
  //   } on FirebaseException catch (e) {
  //    throw Exception( e.message);
  //   }
  // }

  @override
  Future<void> addTodoItem(TaskEntity taskEntity) async {
    final task = TaskModel(
            id: taskEntity.id,
            title: taskEntity.title,
            isDone: taskEntity.isDone)
        .toDocument();
    await firebaseFirestore.collection('tasks').add(task);
  }

  @override
  Stream<List<TaskEntity>> getTodoList() {
    return firebaseFirestore.collection('tasks').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => TaskModel.fromSnapshot(doc)).toList());
  }

  @override
  Future<void> removeTodoItem(String id) async {
    await firebaseFirestore.collection('tasks').doc(id).delete();
  }
}
