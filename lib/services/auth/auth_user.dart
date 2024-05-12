import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';


@immutable
class Authuser {
  final String id ;
  final String email ;
final bool isemailverified ;

 const  Authuser( { required this.id,
                    required this.email, 
                    required this.isemailverified});



 factory Authuser.fromFirebase(User user) => 
 Authuser(email : user.email! ,
  isemailverified: user.emailVerified,
   id: user.uid,);


}