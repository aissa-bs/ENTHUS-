
// import 'package:fitness/services/auth/auth_exception.dart';
// import 'package:fitness/services/auth/auth_service.dart';
// import 'package:fitness/utilities/dialog/error_dialog.dart';
// import 'package:fitness/view/constants/routes.dart';
// import 'package:flutter/material.dart';







// class registerview extends StatefulWidget {
//   const registerview({super.key});

//   @override
//   State<registerview> createState() => _registerviewState();
// }

// class _registerviewState extends State<registerview> {
//    late final TextEditingController _email ;
//    late final TextEditingController _password ;
//    late final TextEditingController _firstname;
//    late final TextEditingController _lastname ;


// @override
//   void initState() {
//     _email = TextEditingController();
//     _password = TextEditingController();
//     _firstname = TextEditingController();
//     _lastname = TextEditingController();

//     super.initState();
//   }

// @override
//   void dispose() {
//     _email.dispose();
//     _password.dispose();
//     _firstname.dispose();
//     _lastname.dispose();
//     super.dispose();
//   }
//    @override
//   Widget build(BuildContext context) {
    
//        return Scaffold(
//         appBar : AppBar (title: const Text("register"),backgroundColor: Colors.blue,),
//          body :  Column (children: [
//                TextField( controller:  _email,
//                keyboardType: TextInputType.emailAddress,
//                decoration:const  InputDecoration( hintText: '  enter your email here'),),
         
         
         
//                TextField( controller:  _password,
//                obscureText: true,
//                enableSuggestions: false,
//                autocorrect: false,
//                decoration:const  InputDecoration( hintText: '  enter your password here')
//                ),
         
         
//                TextButton(onPressed: () async {
//           final email = _email.text;
//           final password = _password.text;
//           final firstname = _password.text;
//           final lastname = _password.text;
//     try{ await Authservice.Firebase().creatuser(
//       email: email,
//        password: password, firstname: firstname, lastname: last);

//                 Navigator.of(context).pushNamed(
//               verifyemailroute, );
//               Authservice.Firebase().sendemailverification();
//               } on Weakpasswordauthexception{
//                 showerrordialog(context, "weak password");
//               } on Emailusedauthexception{
//                 showerrordialog(context, "Email allredy used");

//               } on Invalidemailauthexception{
//                 showerrordialog(context, "invalid email adress");

//               } on Genericauthexception{
//                 await showerrordialog(context, 
//                     'auth error',);

//               }
         
         
//                },
//                child: const Text('register'),
//                ),
//                TextButton(onPressed: (){

//             Navigator.of(context).pushNamedAndRemoveUntil(loginroute, (route) => false);
//       }, child: const Text("login here"),)
//                ],),
//        );
//   }
// }
