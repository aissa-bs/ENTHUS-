import 'package:flutter/material.dart';

class Usertile extends StatelessWidget {

  final void Function()? onTap;
  final String text ;

  const Usertile({
    super.key, 
    required this.onTap, 
    required this.text
    });



  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 229, 217, 255),
        borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(Icons.person, color: Color.fromARGB(255, 41, 5, 124),),
            const SizedBox(width: 20,),

            Text(text, style: TextStyle(color:Color.fromARGB(255, 41, 5, 124),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
             ),)
          ],
        ),
      ),
    );
  }
}