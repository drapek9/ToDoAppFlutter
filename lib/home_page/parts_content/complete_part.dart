import 'package:flutter/material.dart';
import 'package:to_to_apka/structures/task_logic.dart';

class CompletePart extends StatefulWidget {
  final List<CompleteTask> dataCompleteTasks;

  CompletePart({required this.dataCompleteTasks});

  @override
  State<CompletePart> createState() => _CompletePartState();
}

class _CompletePartState extends State<CompletePart> {

  List<CompleteTask> dataCompleteTasks = [];

  @override
  void initState() {
    super.initState();
    dataCompleteTasks = widget.dataCompleteTasks;
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemCount: dataCompleteTasks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                    child: Text(dataCompleteTasks[index].taskName),
                  ),
                ),
              );
            },);
  }
}