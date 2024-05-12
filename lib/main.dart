
import 'package:fitness/services/auth/auth_service.dart';
import 'package:fitness/view/constants/routes.dart';
import 'package:fitness/view/login/complete_profile_view.dart';
import 'package:fitness/view/login/signup_view.dart';
import 'package:fitness/view/login/verifyemailview.dart';
import 'package:fitness/view/main_tab/main_tab_view.dart';
import 'package:fitness/view/login/login_view.dart';
import 'package:flutter/material.dart';

import 'common/colo_extension.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness 3 in 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.()
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: TColor.primaryColor1,
        fontFamily: "Poppins"
      ),
      
      home: const Homepage(),
      routes: {
        loginroute:(context) => const LoginView(),
        registerroute:(context) => const SignUpView(),
        verifyemailroute:(context) => const verifyemailview(),
        completeProfileroute:(context) => const CompleteProfileView(),
        // registerviewroute:(context) => const registerview(),

      },
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

   @override
  Widget build(BuildContext context) {
    return FutureBuilder(
       future : Authservice.Firebase().initialize(),
      builder: (context, snapshot){
        switch(snapshot.connectionState){
          
      
          case ConnectionState.done:
          final user = Authservice.Firebase().currentUser ;
          if(user != null ){
            if(user.isemailverified){
              return const MainTabView();
            }else{
            return const verifyemailview();
          }

          }else {
            return const LoginView();
          }
          
         
            default : 
             return const CircularProgressIndicator();
        }
         
      },
       );
  }
}