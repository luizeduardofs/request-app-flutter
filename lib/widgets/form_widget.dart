import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/todo_controller.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final TextEditingController _titleTodoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _titleTodoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TodoController controller = context.read<TodoController>();

    return SizedBox(
      width: 300,
      height: 100,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _titleTodoController,
              autocorrect: false,
              autofocus: true,
              keyboardType: TextInputType.text,
              onChanged: (value) => controller.setTodoTitle(value),
            ),
          ],
        ),
      ),
    );
  }
}
