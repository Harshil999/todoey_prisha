import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_prisha/models/tasks_data.dart';
import 'package:todoey_prisha/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  // List<Task> tasks = [
  //   Task(
  //     taskName: 'abcd',
  //     isDone: false,
  //   ),
  //   Task(
  //     taskName: 'prro',
  //     isDone: false,
  //   ),
  //   Task(
  //     taskName: 'xyz',
  //     isDone: false,
  //   ),
  // ];

  //below to call Function in Listview.Builder for reference
  // void checkboxCallback(index, callbackValue) {
  //   setState(() {
  //     tasks[index].isDone = callbackValue;
  //   });
  //   // print('ischecked: ${isChecked}');
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      //below (context, value, child) -> value can replace Provider.of<TaskData>(context)
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              // taskNm: Provider.of<TaskData>(context).tasks[index].taskName,
              taskNm: taskData.tasks[index].taskName,
              isChecked: taskData.tasks[index].isDone,
              idx: index,
              longPressCallback: () {
                taskData.deleteTask(index);
              },
              //Below example of callback which we are not using due to use of Provider package
              // checkboxCallback: (chkcallback) {
              //   // setState(() {
              //   //   tasks[index].isDone = chkcallback;
              //   // });
              // },
              //calling method to update checkbox state checked or unchecked
              // checkboxCallback: (chkcallback) {
              //   checkboxCallback(index, chkcallback);
              // },
            );
          },
          itemCount: taskData.tasks.length,
        );
      },
    );
    // return Column(
    //   children: <Widget>[
    //     TaskTile(
    //       taskNm: tasks[0].taskName,
    //       isChecked: tasks[0].isDone,
    //     ),
    //     TaskTile(
    //       taskNm: tasks[1].taskName,
    //       isChecked: tasks[1].isDone,
    //     ),
    //     TaskTile(
    //       taskNm: tasks[2].taskName,
    //       isChecked: tasks[2].isDone,
    //     ),
    //   ],
    // );
  }

//Below Build method to use without Consumer functionality of PROVIDER package
// @override
// Widget build(BuildContext context) {
//   return ListView.builder(
//     itemBuilder: (context, index) {
//       return TaskTile(
//         taskNm: Provider.of<TaskData>(context).tasks[index].taskName,
//         isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
//         checkboxCallback: (chkcallback) {
//           // setState(() {
//           //   tasks[index].isDone = chkcallback;
//           // });
//         },
//         //calling method to update checkbox state checked or unchecked
//         // checkboxCallback: (chkcallback) {
//         //   checkboxCallback(index, chkcallback);
//         // },
//       );
//     },
//     itemCount: Provider.of<TaskData>(context).tasks.length,
//   );
//   // return Column(
//   //   children: <Widget>[
//   //     TaskTile(
//   //       taskNm: tasks[0].taskName,
//   //       isChecked: tasks[0].isDone,
//   //     ),
//   //     TaskTile(
//   //       taskNm: tasks[1].taskName,
//   //       isChecked: tasks[1].isDone,
//   //     ),
//   //     TaskTile(
//   //       taskNm: tasks[2].taskName,
//   //       isChecked: tasks[2].isDone,
//   //     ),
//   //   ],
//   // );
// }
}
