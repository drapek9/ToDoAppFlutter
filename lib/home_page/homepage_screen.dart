import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:to_to_apka/home_page/parts_content/tasks_part.dart';
import 'package:to_to_apka/home_page/parts_content/complete_part.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List tasks = [];
  bool showTasks = true;

  @override
  Widget build(BuildContext context) {

    Map data = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    tasks = data["tasks"];

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
                        )
                      ),
                      child: Text(
                        "Tasks"
                      )
                      ),
                  ),
                  SizedBox(
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
                        )
                      ),
                      child: Text(
                        "Complete"
                      )),
                  ),
                ],
              ),
              Expanded(
                child: IndexedStack(
                  index: showTasks ? 0 : 1,
                  children: [
                    TasksPart(
                      dataTasks: tasks),
                    CompletePart()],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        cursorColor: Colors.black,
                        maxLines: null,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[375],
                          border: InputBorder.none
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                      child: SizedBox(
                        width: 45,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(200), // Kulaté tlačítko
                              ),
                              padding: EdgeInsets.zero),
                          onPressed: (){},
                          child: Icon(
                            Icons.add,
                            color: Colors.black,)),
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