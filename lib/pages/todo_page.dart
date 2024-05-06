import 'package:flutter/material.dart';
import 'package:request_app_flutter/services/todo_service.dart';

class TodoPage extends StatefulWidget {
  final TodoService service = TodoService();

  TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await widget.service.getAllTodos();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var todos = widget.service.todo;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Page'),
      ),
      body: todos == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.title),
                );
              },
            ),
    );
  }
}
