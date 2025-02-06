import 'package:flutter/material.dart';
import 'package:to_to_apka/structures/task_logic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void duratttion () async {
    await Future.delayed(Duration(milliseconds: 500));

    List<Task> data = [
      Task(taskName: "Complete FieldPath app", level: 10),
      Task(taskName: "Clean your room", level: 2),
      Task(taskName: "Cook dinner for your parent", level: 6),
      Task(taskName: "Call your grandparents", level: 3),
      Task(taskName: "Complete FieldPath app", level: 10),
      Task(taskName: "Clean your room", level: 2),
      Task(taskName: "Cook dinner for your parent", level: 6),
      Task(taskName: "Call your grandparents", level: 3),
      Task(taskName: "Complete FieldPath app", level: 10),
      Task(taskName: "Clean your room", level: 2),
      Task(taskName: "Cook dinner for your parent", level: 6),
      Task(taskName: "Call your grandparents", level: 3),
      ];

      Navigator.pushNamed(context, "/home", arguments: {
        "tasks": data
      });
    
  }

  @override
  void initState() {
    super.initState();
    duratttion();
  }

  @override
  Widget build(BuildContext context) {

    return SpinKitFoldingCube(
      color: Colors.white,
      size: 50.0,
      );
  }
}