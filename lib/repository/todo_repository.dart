import 'package:flutter_application_4/models/todo.dart';
import 'package:flutter_application_4/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TodoRepository implements Repository{
  String dataURL = "https://jsonplaceholder.typicode.com";
  
  @override
  Future<String> deleteCompleted(Todo todo) async {
    // TODO: implement deleteCompleted
     var url = Uri.parse('$dataURL/todos/${todo.id}');
    var result = 'false';
    // callback data
    await http.delete(url).then((value) {
      print(value.body);
      return result = 'true';
    });

    return result;
  }
  
  @override
  Future<List<Todo>> getTodoList() async {
    // TODO: implement getTodoList
    
    List<Todo> todoList = [];
    var url = Uri.parse('$dataURL/todos');
    var response = await http.get(url);
    print('status code: ${response.statusCode}');
    var body = json.decode(response.body);

    for (var i = 0; i < body.length; i++) {
      todoList.add(Todo.fromJson(body[i]));
    }
    return todoList;
  }
  
  @override
  Future<String> patchCompleted(Todo todo) {
    // TODO: implement patchCompleted
    throw UnimplementedError();
  }
  
  @override
  Future<String> postCompleted(Todo todo) async {
    // TODO: implement postCompleted
     var url = Uri.parse('$dataURL/todos/${todo.id}');
    // callback data
    String resData = '';
    await http.patch(
      url,
      body: {
        'completed': (!todo.completed!).toString(),
      },
      headers: {'Authorization': 'your_token'},
    ).then((response) {
      Map<String, dynamic> result = json.decode(response.body);
      print(result);
      return resData = result['completed'];
      // make call
    });

    return resData;
  }
  
  @override
  Future<String> putCompleled(Todo todo) async {
    // TODO: implement putCompleled
     var url = Uri.parse('$dataURL/todos/${todo.id}');
    // callback data
    String resData = '';
    await http.put(
      url,
      body: {
        'completed': (!todo.completed!).toString(),
      },
      headers: {'Authorization': 'your_token'},
    ).then((response) {
      Map<String, dynamic> result = json.decode(response.body);
      print(result);
      return resData = result['completed'];
      // make call
    });

    return resData;
  }

}
