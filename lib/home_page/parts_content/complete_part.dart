import 'package:flutter/material.dart';
import 'package:to_to_apka/structures/task_logic.dart';

class CompletePart extends StatefulWidget {
  final List<CompleteTask> dataCompleteTasks;
  final Function(CompleteTask) restoreFunction;
  final Function(CompleteTask) deleteFunction;

  CompletePart({required this.dataCompleteTasks, required this.restoreFunction, required this.deleteFunction});

  @override
  State<CompletePart> createState() => _CompletePartState();
}

class _CompletePartState extends State<CompletePart> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemCount: widget.dataCompleteTasks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Opacity(
                  opacity: .75,
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
                                  widget.dataCompleteTasks[index].taskName,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    )),
                                Text(
                                  "level: ${widget.dataCompleteTasks[index].level}",
                                  style: TextStyle(
                                    fontSize: 13
                                  ),)
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              TextButton(
                                onPressed: (){
                                  widget.restoreFunction(widget.dataCompleteTasks[index]);
                                },
                                child: Text(
                                  "Restore",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold
                                  ),
                                  )),
                              IconButton(
                                onPressed: (){
                                  widget.deleteFunction(widget.dataCompleteTasks[index]);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },);
  }
}