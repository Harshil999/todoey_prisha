import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_prisha/models/tasks_data.dart';

class TaskTile extends StatelessWidget {
  TaskTile({
    super.key,
    required this.taskNm,
    required this.isChecked,
    required this.idx,
    required this.longPressCallback,
    // required this.checkboxCallback,
  });

  late String taskNm;
  late bool isChecked = false;
  late int idx;
  late Function longPressCallback;

  // late Function checkboxCallback;

  //below commented due to refer callback effect in future
  // void checkboxCallback(callbackValue) {
  //   setState(() {
  //     isChecked = callbackValue;
  //   });
  //   print('ischecked: ${isChecked}');
  // }

  @override
  Widget build(BuildContext context) {
    // print('taskNm: ${taskNm}');
    // print('ischecked: ${isChecked}');
    return ListTile(
      title: Text(
        taskNm,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      onLongPress: () {
        longPressCallback();
      },
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (value) {
          // checkboxCallback(value);
          Provider.of<TaskData>(context, listen: false).checkTask(idx, value!);
        },
      ),
      //below commented to refer callback effect in future
      // checkboxCallbk: (callbackValue) {
      //   checkboxCallback(callbackValue);
      // },
    );
  }
}

//below commented to refer callback effect in future
// class TaskCheckbox extends StatelessWidget {
//   TaskCheckbox({
//     required this.checkboxState,
//     required this.checkboxCallbk,
//   });
//
//   final bool checkboxState;
//   final Function checkboxCallbk;
//
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       activeColor: Colors.lightBlueAccent,
//       value: checkboxState,
//       onChanged: (value) {
//         checkboxCallbk(value);
//       },
//     );
//   }
// }
