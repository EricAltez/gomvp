import 'package:flutter/material.dart';
import 'package:flutter_frontend/user_service.dart';
import 'package:flutter_frontend/user_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _userService = UserService();

  @override
  Widget build(BuildContext context) {
    const title = 'User List';

    return MaterialApp(
      title: title,
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xffdddddd)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: FutureBuilder<List<User>>(
          future: _userService.getUsers(),
          builder: (context, snapshot) {
            var users = snapshot.data ?? [];

            if(!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                var user = users[index];
                return ListTile(
                  title: Text(users[index].name),
                  subtitle: Text('#${user.id} ${user.name}'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}