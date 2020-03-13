
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/add_task_provider.dart';
import 'package:to_do_app/card_provider.dart';
import 'package:to_do_app/card_screen.dart';
import 'package:to_do_app/dipslay_task_screen.dart';
import 'package:to_do_app/task_provider.dart';

void main() => runApp(ToDo());

class ToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: CardList(),),
          ChangeNotifierProvider.value(value: TaskList(),)
        ],
    child:  MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.red,
      ),
      home: CardScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        CardScreen.routeId: (context) => CardScreen(),

      },
    )
    );
  }
}

