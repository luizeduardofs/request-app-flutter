import 'package:flutter/material.dart';
import 'package:request_app_flutter/pages/todo_page.dart';
import 'package:request_app_flutter/services/user_service.dart';

class HomePage extends StatefulWidget {
  final UserService service = UserService();

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await widget.service.getAllUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var users = widget.service.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: users == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(user.name),
                  trailing: Text(user.email),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) {
                return TodoPage();
              },
            ),
          );
        },
        child: const Icon(Icons.arrow_right),
      ),
    );
  }
}
