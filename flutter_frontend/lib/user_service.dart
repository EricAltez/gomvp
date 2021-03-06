import 'package:dio/dio.dart';
import 'package:flutter_frontend/user_model.dart';

class UserService {
  final String usersURL = 'http://localhost:5000/users';
  final Dio dio = Dio();

  UserService();

  Future<List<User>> getUsers() async {
    late List<User> users;
    try {
      final res = await dio.get(usersURL);

      users = res.data['users']
        .map<User>(
          (item) => User.fromJson(item),
        )
        .toList();
    }
    on DioError catch(e) {
      users = [];
    }

    return users;
  }
}