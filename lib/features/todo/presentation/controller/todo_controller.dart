import 'package:flutter/material.dart';
import 'package:todo/features/todo/domain/entity/toto_entity.dart';

enum TodoState { initial, loading, success, error }

class TodoContoller with ChangeNotifier {
  final List<TodoEntity> _list = [];
  List<TodoEntity> get getList => _list;

  int _countUnfinished = 0;
  int get getCountUnfinished => _countUnfinished;

  TodoState _state = TodoState.initial;
  TodoState get getState => _state;

  void init() async {
    _state = TodoState.loading;
    await Future.delayed(const Duration(seconds: 2));
    _list.add(TodoEntity(name: 'name', description: 'description'));
    _countUnfinished = _list.where((element) => !element.isCheck).length;
    _state = TodoState.success;
    notifyListeners();
  }

  void onChanged(bool isCheck, int index) {
    _list[index].isCheck = isCheck;
    _countUnfinished = _list.where((element) => !element.isCheck).length;
    notifyListeners();
  }
}
