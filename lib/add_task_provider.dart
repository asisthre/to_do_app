import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/task.dart';
import 'package:to_do_app/task_provider.dart';

class AddTask extends StatefulWidget {



  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  @override
  Widget build(BuildContext context) {
    final addTaskProvider=Provider.of<TaskList>(context);
    TextEditingController titleController=new TextEditingController();
    TextEditingController descController=new TextEditingController();
    addTask() {
      String title=titleController.text;
      String desc=descController.text;

      addTaskProvider.addTask(Task(title: title,description: desc));

    }
    return Scaffold(
      body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Image.asset(""),
                TextField(decoration: InputDecoration(labelText: "Title"),
                controller: titleController,
                onSubmitted: addTask(),
                ),
                TextField(decoration: InputDecoration(labelText: "Description"),
                  controller:descController,
                  maxLines: 2,
                  onSubmitted: addTask()
                ),
                RaisedButton(
                  child: Text("Add"),
                  onPressed: (){
                    addTask();
                  },
                )
              ],
            ),
          )),
    );
  }
}
