import 'package:flutter/material.dart';
import 'package:todoey_prisha/models/task.dart';
import 'package:todoey_prisha/models/tasks_data.dart';
import 'package:todoey_prisha/screens/add_task_screen.dart';
import 'package:todoey_prisha/widgets/tasks_list.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  //below method unused due to we directly set task in listview .builder
  //below method only works with stateful widget
  // void addTaskCallback(tskCallback) {
  //   print('task screen: $tskCallback');
  //   Task newTaskItem = Task(
  //     taskName: tskCallback,
  //     isDone: false,
  //   );
  //   // setState(() {
  //   //   tasks.add(newTaskItem);
  //   // });
  //
  //   Provider.of<TaskData>(context, listen: false).addTask(newTaskItem);
  //
  //   print('task screen123: $tskCallback');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.add),
          // child: Icon(Icons.mic),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: AddTaskScreen(),
                  //below adding task logic directly here but not preferring this.
                  // taskItemCallback: (tskAddedItemCallback) {
                  //   // setState(() {
                  //   tasks.add(
                  //     Task(
                  //       taskName: tskAddedItemCallback,
                  //       isDone: false,
                  //     ),
                  //   );
                  //   // });
                  // },
                  //callbackExample to call method where we add new task item
                  // taskItemCallback: (tskAddedItemCallback) {
                  //   //call method to add task -> only works with stateful widget
                  //   // addTaskCallback(tskAddedItemCallback);
                  //
                  //   //Below Working code but not using it and using other method for more security
                  //   // Task newTaskItem = Task(
                  //   //   taskName: tskAddedItemCallback,
                  //   //   isDone: false,
                  //   // );
                  //   // Provider.of<TaskData>(context, listen: false).addTask(newTaskItem);
                  //
                  //   Navigator.pop(context);
                  // },
                  // ),
                ),
              ),
            );
          }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 60.0,
              left: 30.0,
              right: 30.0,
              bottom: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).tasks.length} Tasks',
                  // '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
