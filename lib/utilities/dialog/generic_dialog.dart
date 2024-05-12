import 'package:flutter/material.dart';

typedef Dialogoptionbuilder<T> = Map<String, T?> Function();

Future<T?> showgenericdialog <T>({
  required BuildContext context,
  required String title,
  required String Content,
  required Dialogoptionbuilder optionbuilder,

}   
){
  final option = optionbuilder();
  return showDialog<T>(context: context, 
  builder: (content){

    return AlertDialog(
      title: Text(title),
      content: Text(Content),
      actions: option.keys.map((optiontitle) {
        final  value = option[optiontitle];

        return TextButton(onPressed: (){
          if(value != null){
            Navigator.of(context).pop(value);
          }else{
            Navigator.of(context).pop();
          }


        },
         child: Text(optiontitle)
         
         );
      }).toList(),


    );
  }
  
  
  );


}