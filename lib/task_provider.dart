import 'package:flutter/material.dart';
import 'package:to_do_app/task.dart';


class TaskList with ChangeNotifier {
  List<Task> _taskList=[

  ];
  void addTask(Task tsk){
    _taskList.add(tsk);
  }
  List<Task> get task {
    return [..._taskList];
  }
}