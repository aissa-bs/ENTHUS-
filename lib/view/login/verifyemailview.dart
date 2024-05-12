import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:fitness/services/auth/auth_service.dart';
import 'package:fitness/view/constants/routes.dart';
import 'package:flutter/material.dart';

class verifyemailview extends StatefulWidget {
  const verifyemailview({super.key});

  @override
  State<verifyemailview> createState() => _verifyemailviewState();
}

class _verifyemailviewState extends State<verifyemailview> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar : AppBar (title: const Text("verify email"),
      flexibleSpace: Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[TColor.primaryColor3, TColor.primaryColor3]),
      ),
    ),
  ),

      body: Column(children: [
        SizedBox(
                  height: media.width * 0.05,
                ),
                Container(
                  height: media.width * 0.4,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: TColor.primaryG),
                      borderRadius: BorderRadius.circular(media.width * 0.075)),
                  child: Stack(alignment: Alignment.center, children: [
                    Image.asset(
                      "assets/img/bg_dots.png",
                      height: media.width * 0.4,
                      width: double.maxFinite,
                      fit: BoxFit.fitHeight,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "press send for getting an verification email ",
                                style: TextStyle(
                                    color: TColor.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                ", please open to virify email",
                                style: TextStyle(
                                    color: TColor.white.withOpacity(0.7),
                                    fontSize: 14),
                              ),
                              
                              
                              
                            ],
                          ),
                          
                        ],
                      ),
                    )
                  ]),
                ),

                SizedBox(
                  height: media.width * 0.08,
                ),

        RoundButton(
                  
                    title: "send email verification",
                    onPressed: () async {
            Authservice.Firebase().sendemailverification();
      
        },),
        SizedBox(
                  height: media.width * 0.08,
                ),
        
        
        
        RoundButton(
          
                  
            title: "Restart",
            onPressed: () async {
            await Authservice.Firebase().logout();
            Navigator.of(context).pushNamedAndRemoveUntil(registerroute, (route) => false);
        },
        

        
      )],
      ),
    );

  }
}

