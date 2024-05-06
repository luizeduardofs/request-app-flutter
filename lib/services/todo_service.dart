import 'package:dio/dio.dart';

import '../models/todo_model.dart';

class TodoService {
  final Dio _dio = Dio();
  final String _url = 'https://jsonplaceholder.typicode.com/todos';
  List<Todo>? todo;

  Future<void> getAllTodos() async {
    final response = await _dio.get(_url);
    todo = (response.data as List).map((json) => Todo.fromJson(json)).toList();
  }
}
