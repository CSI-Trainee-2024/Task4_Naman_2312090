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
  var dateController = TextEditingController();
  var timeController = TextEditingController();

  var todoList = [
    [
      'Work Hard',
      '1 hour Daily',
    ],
    ['Drink Coffee', '2 Cup a day'],
    ['Learn Flutter', 'Need to learn more'],
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

  void datePick() async {
    final DateTime? Datepick =
    await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2024));
        // if(Datepick ! =null && Datepick! =DateTime.now()){
        //   setState(() {
        //     dateController.text ="${Datepick.toLocal()}".split('')[0];
        //   });
        // }
  }

  void timePick() async {
    final TimeOfDay? Timepick =
    await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.input);
        //  if(Timepick ){

        // }
  }

  void addTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            //backgroundColor: Color(0xffbac8e0),
            title: Text("Add New task"),
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: customField(
                        editingController: titleController,
                        hintText: 'Title',
                        read: false,
                        addIcon: const Icon(
                          Icons.title_outlined,
                          size: 30,
                        ),
                        //font_hint: 25.0,
                        labelText: 'Title',
                        textLength: 20,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      flex: 2,
                      child: customField(
                        editingController: descriptionController,
                        hintText: 'Description',
                        read: false,
                        addIcon: const Icon(
                          Icons.note_add_outlined,
                          size: 30,
                        ),
                        // font_hint: 25.0,
                        labelText: 'Description',
                        maxLines: 5,
                        textLength: 100,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      flex: 1,
                      child: customField(
                        editingController: dateController,
                        hintText: 'yyyy-mm-dd',
                        read: true,
                        addIcon: const Icon(
                          Icons.calendar_month,
                          size: 30,
                        ),
                        onTap: datePick,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      flex: 1,
                      child: customField(
                        editingController: timeController,
                        read: true,
                        hintText: 'hh-mm',
                        addIcon: const Icon(
                          Icons.timer,
                          size: 30,
                        ),
                        onTap: timePick,
                      )),
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
        backgroundColor: Color(0xff6a85b6),
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
          backgroundColor: Color(0xffbac8e0),
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
