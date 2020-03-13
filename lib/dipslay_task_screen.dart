import 'package:flutter/material.dart';


import 'add_task_provider.dart';

class DisplayTask extends StatefulWidget {

  IconData icon;
  DisplayTask(this.icon);

  @override
  _DisplayTaskState createState() => _DisplayTaskState();
}

class _DisplayTaskState extends State<DisplayTask> {
  @override
  Widget build(BuildContext context) {

    if (widget.icon==Icons.account_circle) {
      return Scaffold(
      appBar: AppBar(
        title: Text("personal"),

        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTask()));
          },),
        ],
      ),
      body: Container(
        child: Card(),
      ),
    );
    } else {
      return Scaffold(
      appBar: AppBar(
        title: Text("work"),

        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTask()));
            },),
        ],
      ),
      body:Container(
        child: Text("work"),
      )
      ,);
    }
  }
}

