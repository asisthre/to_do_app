import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/task_provider.dart';

class PersonalTaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pTask= Provider.of<TaskList>(context);
    return Row();
  }
}