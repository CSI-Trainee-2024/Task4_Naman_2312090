import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatefulWidget {
  TodoList(
      {required this.titleName,
      required this.despName,
      required this.deleteTask});

  final String titleName;
  final String despName;
  final Function(BuildContext) deleteTask;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  bool isChecked = false;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: widget.deleteTask,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(15),
          )
        ]),
        child: ListTile(
          contentPadding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          tileColor: Color(0xff09203f),
          textColor: Colors.white,
          title: Text(
            widget.titleName,
            style: TextStyle(
                fontSize: 22,
                decoration: isChecked
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                decorationThickness: 3),
          ),
          leading: Checkbox(
            checkColor: Colors.black,
            side: BorderSide(color: Colors.white, width: 1),
            fillColor: WidgetStatePropertyAll(Colors.deepPurple.shade200),
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
            value: isChecked,
          ),
          subtitle: Text(
            widget.despName,
            style: TextStyle(fontSize: 17),
          ),
        ),
      ),
    );
  }
}
