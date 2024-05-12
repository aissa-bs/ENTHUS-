import 'package:fitness/utilities/dialog/generic_dialog.dart';
import 'package:flutter/material.dart';


Future<bool> showdeletedialog ( BuildContext context){
  return showgenericdialog(context: context,
   title: 'delete',
    Content: 'Are you sure you want delete this note', 
    optionbuilder: () => {
      'cancel': false,
      'yes': true,

 },
 
 
 ).then((value) => value ?? false);



}