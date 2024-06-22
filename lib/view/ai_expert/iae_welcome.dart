import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:fitness/view/ai_expert/exprogram_info.dart';
import 'package:flutter/material.dart';

class Iawelcome extends StatefulWidget {
  const Iawelcome({super.key});

  @override
  State<Iawelcome> createState() => _IawelcomeState();
}

class _IawelcomeState extends State<Iawelcome> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Nito (IA Expert)"),
        backgroundColor: TColor.white,
        foregroundColor: TColor.black,
        elevation: 0,
      ),
      body:  Container(
         decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/bg.png'), // Replace with your background image path
          fit: BoxFit.cover,
        ),
      ),
        child : Center(
          child: Column(
            children: [
              const SizedBox(height: 30,),
              Text(
                                    "Hi iam NITO !",
                                    style: TextStyle(
                                        color: TColor.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 350,
                width: 350,
                child : Image.asset(
                              "assets/img/Nito.png",
                              width: 300,
                              height: 300,
                            ),
              ),
              const SizedBox(height: 20,),
              Text(
                                    "What you want !",
                                    style: TextStyle(
                                        color: TColor.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
              const SizedBox(height: 20,),
          
              SizedBox(
                width: 300,
                child: RoundButton(title: "Exercices Program", onPressed: (){
                  Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Iaexgetinfo()),
                        );
                }),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: 300,
                child: RoundButton(title: "Diet", onPressed: (){})),
          
          ],),
        )

      ),
    );
  }
}