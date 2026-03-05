import 'package:flutter/material.dart';

class meal_Info extends StatelessWidget {
  final IconData icon;
  final String text;

  const meal_Info({required this.icon,required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: Colors.white,),
        Text(text,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),)
      ],
    );
  }
}
