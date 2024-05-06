import 'package:dio/dio.dart';

import '../models/user_model.dart';

class UserService {
  final Dio _dio = Dio();
  final String _url = 'https://jsonplaceholder.typicode.com/users';
  List<User>? user;

  Future<void> getAllUsers() async {
    final response = await _dio.get(_url);
    user = (response.data as List).map((json) => User.fromJson(json)).toList();
  }
}
