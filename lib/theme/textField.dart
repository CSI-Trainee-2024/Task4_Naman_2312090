import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

class customField extends StatelessWidget {
  final int? maxLines;
  final String hintText;
  final int? textLength;
  final String? labelText;
  final Icon? addIcon;
  final TextEditingController editingController;
  final bool read;
  void Function()? onTap;

  customField(
      {this.maxLines,
      required this.hintText,
      this.textLength,
      this.labelText,
      this.addIcon,
      required this.read,
      required this.editingController, this.onTap
      });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: editingController,
      //keyboardType: TextInputType.multiline,
      maxLength: textLength,
      maxLines: maxLines,
      readOnly: read,
      decoration: InputDecoration(
        //filled: true,
        prefixIcon: addIcon,
        labelText: labelText,
        //labelStyle: TextStyle(color: Color(0xff537895)),
        hintText: hintText,
        // hintStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        enabled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xff09203f), width: 3)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xff537895), width: 3)),
      ),
      onTap: onTap,
    );
  }
}
