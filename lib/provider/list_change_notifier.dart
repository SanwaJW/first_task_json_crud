import 'package:first_task_json_crud/models/user.dart';
import 'package:first_task_json_crud/service/crud_dio.dart';
import 'package:flutter/cupertino.dart';

class ListChangeNotifier extends ChangeNotifier {
  final UserService _userService = UserService();
  late List<User> _users;

  Future<List<User>> get user async {
    _users = await _userService.allUserList();
    return _users;
  }
}
