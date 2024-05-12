import 'package:fitness/utilities/dialog/generic_dialog.dart';
import 'package:flutter/material.dart';


Future<bool> showlogoutdialog ( BuildContext context){
  return showgenericdialog(context: context,
   title: 'log out',
    Content: 'Are you sure you want to logout', 
    optionbuilder: () => {
      'cancel': false,
      'log out': true,

 },
 
 
 ).then((value) => value ?? false);



}