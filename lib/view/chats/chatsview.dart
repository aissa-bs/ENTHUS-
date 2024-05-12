import 'package:fitness/common_widget/usertile.dart';
import 'package:fitness/services/auth/auth_service.dart';
import 'package:fitness/services/chat/chat_service.dart';
import 'package:fitness/view/chats/chatpage.dart';
import 'package:flutter/material.dart';

class Chatsview extends StatefulWidget {
  const Chatsview({super.key});

  @override
  State<Chatsview> createState() => _ChatsviewState();
}

class _ChatsviewState extends State<Chatsview> {
  
  final Chatservice _chatservice =Chatservice();
  final user = Authservice.Firebase().currentUser ;





  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Chats", style: TextStyle(color:Color.fromARGB(255, 171, 152, 214),
                  
             ),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,


      ),
      body: _builduserlist(),
    );
  }
   Widget _builduserlist(){
    return StreamBuilder(stream: _chatservice.getUserStream(), 
    builder: (context, snapshot) {
      if(snapshot.hasError){
        return const Text("error");
      }
      if(snapshot.connectionState == ConnectionState.waiting){
        return const Text("loading");
      }

      return ListView(
        children: snapshot.data!.map<Widget>((userData)=> 
        _builduseritem(userData,context)
        ).toList(),

      );

    },);
   }

   Widget _builduseritem(Map<String,dynamic> userData, BuildContext context){


    if(userData["user_id"] != user?.id ) {
      return Usertile(
      text : userData["firstname"],
      onTap: () { 
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Chatpage(recieveremail: userData["firstname"],
           recieverid: userData["user_id"],),));
       }, 
        
      
    );
    }else{
      return Container();
    }
   }


}