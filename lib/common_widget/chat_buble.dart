import 'package:fitness/common/colo_extension.dart';
import 'package:flutter/material.dart';

class Chatbubble extends StatelessWidget {
  final String message;
  final bool iscuurentuser ;
  const Chatbubble({super.key, required this.message, required this.iscuurentuser});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color:  iscuurentuser ? TColor.primaryColor1 : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 2.5, horizontal: 25),



      child: Text(message, style: TextStyle(color:  iscuurentuser ? Colors.white : Colors.black,),),
      



    );
  }
}