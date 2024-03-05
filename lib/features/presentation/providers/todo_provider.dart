import 'package:clean_arch_app/features/domain/usercases/add_todo_usecase.dart';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier{
  List<String> _todoList = [];
  List<String> get todoList => _todoList;



  void removeTodoItem(String item){
    _todoList.remove(item);
    notifyListeners();
  }
}