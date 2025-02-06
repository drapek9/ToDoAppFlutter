import 'package:flutter/material.dart';
import 'package:to_to_apka/structures/task_logic.dart';

class TasksPart extends StatefulWidget {

  final List<Task> dataTasks;
  final Function(Task) deleteFunction;
  final Function(Task) completedFunction;

  TasksPart({required this.dataTasks, required this.deleteFunction, required this.completedFunction});

  @override
  State<TasksPart> createState() => _TasksPartState();
}

class _TasksPartState extends State<TasksPart> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemCount: widget.dataTasks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.dataTasks[index].taskName,
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),),
                              Text(
                                "level: ${widget.dataTasks[index].level}",
                                style: TextStyle(
                                  fontSize: 13
                                ),)
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: (){
                                widget.completedFunction(
                                  widget.dataTasks[index]
                                );
                              },
                              icon: Icon(
                                Icons.check,
                                color: const Color.fromARGB(255, 37, 192, 43),)),
                            IconButton(
                              onPressed: (){
                                widget.deleteFunction(
                                  widget.dataTasks[index]
                                );
                              },
                              icon: Icon(
                                Icons.delete,
                                color: const Color.fromARGB(255, 255, 111, 101),)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },);
  }
}