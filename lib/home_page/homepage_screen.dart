import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:to_to_apka/home_page/parts_content/tasks_part.dart';
import 'package:to_to_apka/home_page/parts_content/complete_part.dart';
import 'package:to_to_apka/structures/task_logic.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/data.json');
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<Task> tasks = [];
  List<CompleteTask> tasksComplete = [];
  bool showTasks = true;
  int lengthAddText = 0;
  int selectedLevel = 1;

  TextEditingController myController = TextEditingController();

  void setLocalStorage() async{
    final file = await _localFile;
    Map result = jsonDecode(await file.readAsString());
    result["tasks"] = [];
    tasks.forEach((one){
      result["tasks"].add({"taskName": one.taskName, "level": one.level});
    });
    result["complete_tasks"] = [];
    tasksComplete.forEach((one){
      result["complete_tasks"].add({"taskName": one.taskName, "level": one.level});
    });

    file.writeAsString(jsonEncode(result));
  }

  void addTaskToTasks(taskName, level){
    setState(() {
      tasks.add(Task(level: level, taskName: taskName));
    });
    setLocalStorage();
  }

  void deleteTask (Task theTask){
    setState(() {
      tasks.remove(theTask);
    });
    setLocalStorage();
  }

  void deleteCompletedTask (CompleteTask theTask){
    setState(() {
      tasksComplete.remove(theTask);
    });
    setLocalStorage();
  }

  void completedTask (Task theTask){
    CompleteTask newCompleteTask = CompleteTask(taskName: theTask.taskName, level: theTask.level);
    setState(() {
      tasksComplete.add(newCompleteTask);
    });
    deleteTask(theTask);
  }

  void restoreTask (CompleteTask theTask){
    
    addTaskToTasks(theTask.taskName, theTask.level);
    deleteCompletedTask(theTask);
  }

  @override
  Widget build(BuildContext context) {

    myController.addListener((){
      setState(() {
        lengthAddText = myController.text.length;
      });
      
    });

    Map data = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    tasks = data["tasks"];
    tasksComplete = data["complete_tasks"];

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    // width: showTasks ? 150: 100,
                    width: 125,
                    child: ElevatedButton(
                      onPressed: !showTasks ? (){
                        setState(() {
                          showTasks = true;
                        });
                        } : null,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.zero,
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.zero,
                          )
                        ),
                        disabledBackgroundColor: const Color.fromARGB(222, 0, 0, 0),
                        disabledForegroundColor: Colors.white,
                        foregroundColor: Colors.black
                      ),
                      child: Text(
                        "Tasks",
                        // style: TextStyle(
                        //   fontSize: showTasks ? 16: 12
                        // ),
                      )
                      ),
                  ),
                  SizedBox(
                    // width: !showTasks ? 150: 100,
                    width: 125,
                    child: ElevatedButton(
                      onPressed: showTasks ? (){
                        setState(() {
                          showTasks = false;
                        });
                      } : null,
                      
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.zero,
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.zero,
                            bottomRight: Radius.circular(12),
                          )
                        ),
                        disabledBackgroundColor: const Color.fromARGB(222, 0, 0, 0),
                        disabledForegroundColor: Colors.white,
                        foregroundColor: Colors.black
                      ),
                      child: Text(
                        "Complete",
                        // style: TextStyle(
                        //   fontSize: !showTasks ? 16: 10
                        // ),
                      )),
                  ),
                ],
              ),
              Expanded(
                child: IndexedStack(
                  index: showTasks ? 0 : 1,
                  children: [
                    TasksPart(
                      dataTasks: tasks,
                      deleteFunction: deleteTask,
                      completedFunction: completedTask),
                    CompletePart(
                      dataCompleteTasks: tasksComplete,
                      restoreFunction: restoreTask,
                      deleteFunction: deleteCompletedTask
                      )],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 4),
                child: Row(
                  children: [
                    Container(
                      color: Colors.grey[400],
                      child: DropdownButton<int>(
                        dropdownColor: Colors.grey[400],
                        underline: SizedBox(),
                        padding: EdgeInsets.only(left: 10, right: 5),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
                        ),
                        iconEnabledColor: Colors.black,
                        value: selectedLevel,
                        items: List.generate(10, (index) => index + 1).map(
                          (num) => DropdownMenuItem<int>(
                      
                            value: num,
                            child: Text("$num"),
                        )
                        ).toList(),
                        onChanged: (theValue){
                          setState(() {
                            selectedLevel = theValue!;
                          });
                        },),
                    ),
                    Expanded(
                      child: TextField(
                        maxLength: 50,
                        controller: myController,
                        cursorColor: Colors.black,
                        maxLines: null,
                        decoration: InputDecoration(
                          counterText: "",
                          filled: true,
                          fillColor: Colors.grey[375],
                          border: InputBorder.none,
                          hintText: "Enter new task",
                          suffixText: "$lengthAddText/50"
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: SizedBox(
                        width: 45,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(200), // Kulaté tlačítko
                              ),
                              padding: EdgeInsets.zero),
                          onPressed: (){
                            String textFieldContent = myController.text.trim();
                    
                            if (textFieldContent != ""){
                              addTaskToTasks(textFieldContent, selectedLevel);
                              myController.clear();
                            }
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 25,)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )),
    );
  }
}