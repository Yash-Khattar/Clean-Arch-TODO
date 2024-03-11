import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'features/data/datasources/firebase_todo_datasource.dart';
import 'features/data/repositories/todo_repository.dart';
import 'features/domain/usecases/add_todo_usecase.dart';
import 'features/domain/usecases/delete_todo_usecase.dart';
import 'features/domain/usecases/get_todo_usecase.dart';
import 'features/domain/usecases/update_todo_usecase.dart';
import 'features/presentation/pages/todo_list_screen.dart';
import 'features/presentation/providers/todo_provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  await Firebase.initializeApp(); // Initialize Firebase
  setupLocator(); // Setup GetIt
  runApp(MyApp());
}
void setupLocator() {
  GetIt.instance.registerSingleton<FirebaseTodoDataSource>(FirebaseTodoDataSource());
  GetIt.instance.registerFactory<TodoRepository>(() => TodoRepositoryImpl(dataSource: GetIt.instance<FirebaseTodoDataSource>()));
  GetIt.instance.registerFactory<GetTodoList>(() => GetTodoList(repository: GetIt.instance<TodoRepository>()));
  GetIt.instance.registerFactory<AddTodo>(() => AddTodo(repository: GetIt.instance<TodoRepository>()));
  GetIt.instance.registerFactory<DeleteTodo>(() => DeleteTodo(repository: GetIt.instance<TodoRepository>()));
  GetIt.instance.registerFactory<UpdateTodoStatus>(() => UpdateTodoStatus(repository: GetIt.instance<TodoRepository>()));
  GetIt.instance.registerFactory<TodoProvider>(() => TodoProvider(
    getTodoList: GetIt.instance<GetTodoList>(),
    addTodo: GetIt.instance<AddTodo>(),
    deleteTodo: GetIt.instance<DeleteTodo>(),
    updateTodoStatus: GetIt.instance<UpdateTodoStatus>(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GetIt.instance<TodoProvider>(),
        ),
      ],
      child: MaterialApp(
        title: 'Todo App',
        
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TodoListScreen(),
      ),
    );
  }
}
