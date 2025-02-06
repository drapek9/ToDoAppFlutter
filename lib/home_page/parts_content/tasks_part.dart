import 'package:flutter/material.dart';
import 'package:to_to_apka/structures/task_logic.dart';

class TasksPart extends StatefulWidget {

  final List<Task> dataTasks;

  TasksPart({required this.dataTasks});

  @override
  State<TasksPart> createState() => _TasksPartState();
}

class _TasksPartState extends State<TasksPart> {
  List dataTasks = [];

  @override
  void initState() {
    super.initState();
    dataTasks = widget.dataTasks;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                    itemCount: dataTasks.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                            child: Text(dataTasks[index].taskName),
                          ),
                        ),
                      );
                    },);
  }
}