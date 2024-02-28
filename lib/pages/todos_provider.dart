import 'package:flutter_riverpod/flutter_riverpod.dart';
// ChangeNotifier를 사용할 예정이기 때문에 foundation package를 import하겠습니다.
import 'package:flutter/foundation.dart';

import '../models/todo_model.dart';

// state 변수가 없습니다.
class TodosNotifier extends ChangeNotifier {
  // state
  List<Todo> todos = [];

  void addTodo(String desc) {
    todos.add(Todo.add(desc: desc));
    notifyListeners();
  }

  void toggleTodo(String id) {
    // firstWhere: 일치하는 것들 중 첫번째를 찾는다
    final todo = todos.firstWhere((todo) => todo.id == id);
    todo.completed = !todo.completed;
    notifyListeners();
  }

  void removeTodo(String id) {
    // removeWhere: 일치하는 것들 중 첫번째를 삭제한다
    todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}

// final todosProvider = ChangeNotifierProvider<TodosNotifier>((ref) {
final todosProvider = ChangeNotifierProvider.autoDispose<TodosNotifier>((ref) {
  return TodosNotifier();
});