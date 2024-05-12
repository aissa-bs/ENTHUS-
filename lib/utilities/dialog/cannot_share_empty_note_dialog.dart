import 'package:fitness/utilities/dialog/generic_dialog.dart';
import 'package:flutter/material.dart'; 

Future<void> showcannotshareemptydialog(BuildContext context){
  return showgenericdialog<void>(
    context: context,
    title: 'sharing',
    Content: 'you cannot share an empty note',
     optionbuilder: () => {
      'OK' : null,
     });

  
}