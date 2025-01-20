
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final VoidCallback onTapfunction;
  final String text;
  const CustomButton({required this.text,required this.onTapfunction,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapfunction,
    child: Container(
      width:double.infinity,height: 50,decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    gradient: const LinearGradient(colors: [Colors.blue,Colors.pink,Colors.purple] ),
    boxShadow: const [BoxShadow(color: Colors.grey,spreadRadius:5,blurRadius: 10),]
    ),
      child: Center(child: Text(text,style: Theme.of(context).textTheme.titleLarge,)),),
    );
  }
}
