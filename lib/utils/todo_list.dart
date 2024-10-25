import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  TodoList(
      {required this.titleName,
      required this.checkTrue,
      this.onChnaged,
      required this.despName});

  final String titleName;
  final String despName;
  final bool checkTrue;
  final Function(bool?)? onChnaged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        tileColor: Color(0xff09203f),
        textColor: Colors.white,
        title: Text(
          titleName,
          style: TextStyle(
            fontSize: 22,
            // decoration: TextDecoration.lineThrough,
            // decorationThickness: 3
          ),
        ),
        leading: Checkbox(
          activeColor: Colors.amber,
          side: BorderSide(color: Colors.white, width: 2),
          fillColor: WidgetStatePropertyAll(Colors.deepPurple.shade200),
          onChanged: onChnaged,
          value: checkTrue,
        ),
        subtitle: Text(
          despName,
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
