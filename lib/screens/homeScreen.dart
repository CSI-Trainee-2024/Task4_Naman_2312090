// ignore_for_file: sort_child_properties_last

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
    ['Work Out', '1 hour Daily', '8:30', 'EXERCISE'],
    ['Drink Coffee', '2 Cup a day', '9:10', 'PERSONAL'],
    ['Learn Flutter', 'Need to learn more', '12:10', 'WORK'],
  ];

  String? selectedOption;
  var arrOption = ['WORK', 'PERSONAL', 'SHOPPING', 'OTHER'];

  void saveTask() {
    String title = titleController.text;
    String desp = descriptionController.text;
    setState(() {
      todoList
          .add([title, desp, timeController.text, selectedOption.toString()]);
      titleController.clear();
      descriptionController.clear();
      timeController.clear();
    });
  }

  void deleteIndex(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  void datePick() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2024));
  }

  TimeOfDay time = TimeOfDay(hour: 8, minute: 30);

  void timePick() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      //initialEntryMode: TimePickerEntryMode.input
    ).then((value) {
      setState(() {
        time = value!;
        timeController.text = "${time.format(context)}";
      });
    });
  }

  void addTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            //backgroundColor: Color(0xffbac8e0),
            title: Text("Add New task"),

            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
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
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 3, color: Color(0xff09203f))),
                    child: DropdownButton(
                      icon: Icon(Icons.category_rounded),
                      iconSize: 30,
                      isExpanded: true,
                      hint: const Text(
                        "Select a option",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      value: selectedOption,
                      items: arrOption.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          enabled: true,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(colors: [
                                      Color(0xff09203f),
                                      Color(0xff537895)
                                    ]),
                                    border: Border.all(
                                        width: 1, color: Colors.black)),
                                child: Center(
                                    child: Text(
                                  "${value}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ))),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
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
                      // child: MaterialButton(
                      //   onPressed: datePick,
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         border: Border.all(
                      //             color: Color(0xff09203f), width: 3)),
                      //     width: double.infinity,
                      //     child: Text("YYYY-MM-DD"),
                      //   ),
                      // )
                      child: customField(
                        editingController: dateController,
                        hintText: 'YYYY-MM--DD',
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
                        hintText: 'HH-MM',
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
              timeC: todoList[index][2].toString(),
              category: todoList[index][3].toString(),
            );
          },
          itemCount: todoList.length,
        ));
  }
}
