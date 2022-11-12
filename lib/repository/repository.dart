import 'package:flutter_application_4/models/todo.dart';

abstract  class Repository{
  Future<List<Todo>> getTodoList();
  Future<String> patchCompleted(Todo todo);
  Future<String> putCompleled(Todo todo);
  Future<String> deleteCompleted(Todo todo);
  Future<String> postCompleted(Todo todo);
}
