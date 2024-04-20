import 'package:flutter/material.dart';
import 'package:todoey_prisha/models/tasks_data.dart';
import 'package:todoey_prisha/screens/tasks_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TaskData();
        }),
      ],
      child: MaterialApp(
        // home: MyApp1(),
        home: TasksScreen(),
      ),
    );
  }
}
