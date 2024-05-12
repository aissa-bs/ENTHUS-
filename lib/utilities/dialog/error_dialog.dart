import 'package:fitness/utilities/dialog/generic_dialog.dart';
import 'package:flutter/material.dart';

Future<void> showerrordialog(
  BuildContext context,
  String text 
){
  return showgenericdialog<void>(context: context,
   title: 'an error occured',
    Content: text,
     optionbuilder: () => {
      'ok' : null,
     });
}