import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List tasks = [];

  @override
  Widget build(BuildContext context) {

    Map data = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    tasks = data["tasks"];
    print("we are in!");
    print(tasks.length);

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
                      onPressed: (){},
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
                      onPressed: (){},
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
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    print(tasks[index].taskName);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                          child: Text(tasks[index].taskName),
                        ),
                      ),
                    );
                  },),
              )
            ],
          ),
        )),
    );
  }
}