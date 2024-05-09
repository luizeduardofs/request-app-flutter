import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/todo_controller.dart';
import '../models/todo_model.dart';
import '../services/todo_service.dart';
import '../widgets/form_widget.dart';

class TodoPage extends StatefulWidget {
  final TodoService service = TodoService();

  TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  Random random = Random();

  void showCustomDialog(BuildContext context) {
    final TodoController controller = context.watch<TodoController>();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Título do Diálogo"),
          content: const FormWidget(),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Fechar"),
            ),
            ElevatedButton(
                onPressed: () async {
                  Todo newTodo = Todo(
                    userId: random.nextInt(100),
                    id: random.nextInt(100),
                    title: controller.todoTitle,
                    completed: false,
                  );
                  await widget.service.addTodo(newTodo);
                },
                child: const Text('Salvar'))
          ],
        );
      },
    );
  }

  void fetchData() async {
    await widget.service.getAllTodos();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => showCustomDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
