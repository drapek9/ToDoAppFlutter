import 'package:flutter/material.dart';
import 'package:to_to_apka/structures/task_logic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
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

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void duratttion () async {
    await Future.delayed(Duration(milliseconds: 500));
    // Map json = {"tasks": [{"taskName": "Complete FieldPath app", "level": 10}, {"taskName": "Clean your room", "level": 2}], "complete_tasks": [{"taskName": "Začít projekt ve flutter", "level": 2}, {"taskName": "Zkontrolovat google cloud console", "level": 3}]};
    // String str_json = jsonEncode(json);
    final file = await _localFile;
    // await file.writeAsString(str_json);
    List<Task> data = [];
    List<CompleteTask> dataComplete = [];
    if (await file.exists()){
      Map results = jsonDecode(await file.readAsString());

      List task_result = results["tasks"];
      task_result.forEach((one_res){
        data.add(Task(level: one_res["level"], taskName: one_res["taskName"]));
      });

      List complete_results = results["complete_tasks"];

      complete_results.forEach((one_res){
        dataComplete.add(CompleteTask(level: one_res["level"], taskName: one_res["taskName"]));
      });

      
    } else {
      print("nic to nenašlo");
    }

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "tasks": data,
      "complete_tasks": dataComplete
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