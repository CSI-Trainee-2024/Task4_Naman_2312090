import 'package:flutter/material.dart';
import 'package:todo_app/theme/textField.dart';
import 'package:todo_app/utils/todo_list.dart';

class homeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<homeScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  var todoList = [
    [
      'Work Hard',
      'Need to workOut',
    ],
    ['Drink Coffee', 'Need to drink'],
    ['Learn Flutter', 'Need to learn'],
  ];

  void saveTask() {
    String title = titleController.text;
    String desp = descriptionController.text;
    //print("Title is:${title}\nDescription is:${desp}");
    setState(() {
      todoList.add([title, desp]);
      titleController.clear();
      descriptionController.clear();
    });
  }

  void deleteIndex(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

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
                        addIcon: const Icon(
                          Icons.title_outlined,
                          size: 30,
                        ),
                        //font_hint: 25.0,
                        labelText: 'Title',
                        textLength: 30,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      flex: 2,
                      child: customField(
                        editingController: descriptionController,
                        hintText: 'Description',
                        addIcon: const Icon(
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
                    child: const Text("Cancel",
                        style: TextStyle(fontSize: 25, color: Colors.white))),
              ),
              MaterialButton(
                onPressed: () {
                  if (titleController.text == null) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pop(context);
                    saveTask();
                  }
                },
                child: Container(
                    padding: const EdgeInsets.only(
                        bottom: 10, top: 10, left: 20, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xff09203f),
                    ),
                    child: const Text("Add",
                        style: TextStyle(fontSize: 25, color: Colors.white))),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 51, 98, 134),
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
          label: const Text(
            "Add task",
            style: TextStyle(fontSize: 25),
          ),
          icon: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, index) {
            return TodoList(
              titleName: todoList[index][0].toString(),
              despName: todoList[index][1].toString(),
              deleteTask: (context) => deleteIndex(index),
            );
          },
          itemCount: todoList.length,
        ));
  }
}
