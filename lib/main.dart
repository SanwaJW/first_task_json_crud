import 'package:first_task_json_crud/models/user.dart';
import 'package:first_task_json_crud/service/crud_dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _userService = UserService();
  List<User> listOfUsers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await loadUser();
              },
              child: const Text('Load Users'),
            ),
            const SizedBox(height: 16),
            Text(listOfUsers.toString()),
          ],
        ),
      ),
    );
  }

  Future<void> loadUser() async {
    List<User> users = [];
    // users = await _userService.allUserList();

    // await _userService.addUser(User(
    //     id: '',
    //     firstName: 'sjname',
    //     lastName: 'lastname',
    //     department: 'department'));

    // _userService.updateUser(User(
    //     id: '1',
    //     firstName: 'firstName',
    //     lastName: 'lastName',
    //     department: 'cs'));

    //   _userService.deleteUser("10");

      setState(() {
        listOfUsers = users;
      });
  }
}
