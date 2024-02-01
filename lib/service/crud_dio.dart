import 'package:first_task_json_crud/models/user.dart';
import 'package:first_task_json_crud/repository/user_repository.dart';

class UserService {
  final UserRepository _userRepository = UserRepository();

  Future<List<User>> allUserList() async {
    final List<User> allUsers = [];
    final userData = await _userRepository.getData();
    for (var userDataMap in userData) {
      final user = User.fromMap(userDataMap);
      allUsers.add(user);
    }
    return allUsers;
  }

  Future<User> addUser(User user) async {
    String? id = user.id;
    String? firstName = user.firstName;
    String? lastName = user.lastName;
    String? department = user.department;
    var jsonResponse =
        await _userRepository.postData(id!, firstName!, lastName!, department!);
    final newUser = User.fromMap(jsonResponse);
    return newUser;
  }

  Future<User> updateUser(User user) async {
    String? id = user.id;
    String? firstName = user.firstName;
    String? lastName = user.lastName;
    String? department = user.department;
    var jsonResponse =
        await _userRepository.putData(id!, firstName!, lastName!, department!);
    final newUser = User.fromMap(jsonResponse);
    return newUser;
  }

  Future<User> deleteUser(String id) async {
    var jsonResponse = await _userRepository.deleteData(id);
    final newUser = User.fromMap(jsonResponse);
    return newUser;
  }
}
