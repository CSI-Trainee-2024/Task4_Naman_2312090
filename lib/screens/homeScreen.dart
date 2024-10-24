import 'package:flutter/material.dart';
import 'package:todo_app/theme/textField.dart';

class homeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<homeScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  void addTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.deepPurple.shade200,
            title: Text("Add New task"),
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: customField(
                        editingController: titleController,
                        hintText: 'Title',
                        addIcon: Icon(
                          Icons.title_outlined,
                          size: 30,
                        ),
                        //font_hint: 25.0,
                        labelText: 'Title',
                        textLength: 30,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      flex: 2,
                      child: customField(
                        editingController: descriptionController,
                        hintText: 'Description',
                        addIcon: Icon(
                          Icons.note_add_outlined,
                          size: 30,
                        ),
                        // font_hint: 25.0,
                        labelText: 'Description',
                        maxLines: 5,
                        textLength: 60,
                      ))
                ],
              ),
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xff09203f),
                    ),
                    child: Text("Cancel",
                        style: TextStyle(fontSize: 25, color: Colors.white))),
              ),
              MaterialButton(
                onPressed: () {
                  String title = titleController.text;
                  String desp = descriptionController.text;
                  print("Title is:${title}\nDescription is:${desp}");
                },
                child: Container(
                    padding: EdgeInsets.only(
                        bottom: 10, top: 10, left: 20, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xff09203f),
                    ),
                    child: Text("Add",
                        style: TextStyle(fontSize: 25, color: Colors.white))),
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
        backgroundColor: Colors.deepPurple.shade200,
        foregroundColor: Colors.black,
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
