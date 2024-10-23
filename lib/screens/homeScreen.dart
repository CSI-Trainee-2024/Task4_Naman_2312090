import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<homeScreen> {
  void addTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Add New task"),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(child: TextField(
                      decoration: InputDecoration(
                        //alignLabelWithHint: true
                        hintText: 'Title'
                      ),
                    )),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                          child: TextField(
                      )))
                ],
              ),
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text("Add"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Daily Dash",
          style: TextStyle(fontSize: 28),
        )),
        backgroundColor: Color(0xff09203f),
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 10,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        onPressed: addTask,
        label: Text(
          "Add task",
          style: TextStyle(fontSize: 25),
        ),
        icon: Icon(
          Icons.add,
          size: 35,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 45, 74, 96)),
        //child: ListView.builder(itemBuilder: ),
      ),
    );
  }
}
