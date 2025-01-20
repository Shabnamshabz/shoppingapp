import 'package:flutter/material.dart';
class TextfieldWidget extends StatelessWidget {
  String name;
  TextEditingController? controller;
  TextfieldWidget({
    required this.name,required this.controller
  });


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: name,
        //labelText: "Name",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),

      ),

    );
  }
}
