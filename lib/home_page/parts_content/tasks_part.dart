import 'package:flutter/material.dart';

class TasksPart extends StatefulWidget {
  // const TasksPart({super.key});

  final List dataTasks;

  TasksPart({required this.dataTasks});

  @override
  State<TasksPart> createState() => _TasksPartState();
}

class _TasksPartState extends State<TasksPart> {
  List dataTasks = [];

  @override
  void initState() {
    // TODO: implement initState
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