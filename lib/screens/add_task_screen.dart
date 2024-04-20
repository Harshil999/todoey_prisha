import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_prisha/models/tasks_data.dart';

class AddTaskScreen extends StatelessWidget {
  // AddTaskScreen({
  //   super.key,
  //   required this.taskItemCallback,
  // });
  //
  // late Function taskItemCallback;

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
                print(newTaskTitle);
              },
            ),
            ElevatedButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.lightBlueAccent,
              ),
              onPressed: () {
                print('new item: $newTaskTitle');
                Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                Navigator.pop(context);
                // taskItemCallback(newTaskTitle);
              },
            ),
          ],
        ),
      ),
    );
  }
}
