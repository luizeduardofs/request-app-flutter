import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/todo_controller.dart';
import 'pages/home_page.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TodoController>(create: (_) => TodoController()),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
