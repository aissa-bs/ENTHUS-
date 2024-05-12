import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/common_widget/chat_buble.dart';
import 'package:fitness/common_widget/round_textfield.dart';
import 'package:fitness/services/auth/auth_service.dart';
import 'package:fitness/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Chatpage extends StatefulWidget {
  final String recieveremail ;
  final String recieverid ;
   Chatpage({super.key,
    required this.recieveremail, 
    required this.recieverid});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
   final TextEditingController _messagecontroller = TextEditingController();

  final Chatservice _chatservice = Chatservice();

  final Authservice _authservice = Authservice.Firebase();

  FocusNode myfocusnode = FocusNode();

  @override
  void initState() {
    super.initState();

    myfocusnode.addListener(() {
      if(myfocusnode.hasFocus){
        Future.delayed(const Duration(milliseconds: 500),
        () => scrollDown(),
        );
       }});

       Future.delayed(const Duration(milliseconds: 500),
       () => scrollDown(),
       );



       }
  @override
  void dispose() {
    super.dispose();
    myfocusnode.dispose();
    _messagecontroller.dispose();
  }

  final ScrollController _scrollController = ScrollController();
  void scrollDown (){
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
     duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn);
  }

  void sendmessage() async{
    if(_messagecontroller.text.isNotEmpty){
      await _chatservice.sendmessage(widget.recieverid, _messagecontroller.text);
      _messagecontroller.clear();

    }
    scrollDown();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      
        title : Text(widget.recieveremail, style: TextStyle(color:Color.fromARGB(255, 148, 122, 209),
                  
             ),),
         backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
      ),
      body: Container(
        color:  Color.fromARGB(255, 242, 237, 253),
        child: Column(
          children: [
            Expanded(
              child: _buidmessagelist(),
            ),
            _builduserinput(),
          ],
        ),
      ),
    );
  }

Widget _buidmessagelist(){
  String senderid = _authservice.currentUser!.id ;
  return StreamBuilder(
    stream:  _chatservice.getmessages(widget.recieverid, senderid),
    builder: (context, snapshot) {
      if(snapshot.hasError){
        return const Text("error");
      }
      if(snapshot.connectionState == ConnectionState.waiting){
        return const Text("loading");
      }

      return ListView(
        controller: _scrollController,
        children:  snapshot.data!.docs.map((doc) 
        => _buildmessageitem(doc)).toList(),

      );
    },
    
  );
}

 Widget _buildmessageitem(DocumentSnapshot doc){
  Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

  bool iscuurentuser = data['senderid'] == _authservice.currentUser!.id;

  var alignment = iscuurentuser ? Alignment.centerRight : Alignment.centerLeft ;


  return Container(
    alignment: alignment,
    child : Column(
      crossAxisAlignment: iscuurentuser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Chatbubble(message: data["message"], iscuurentuser: iscuurentuser)
      ],
    ));
 }

 Widget _builduserinput (){
  return Padding(
    padding: const EdgeInsets.only(bottom: 25, top: 7, left: 7),
    child: Row(
      children: [
        Expanded(child: RoundTextField(

                    
                    focusNode: myfocusnode,
                    controller:  _messagecontroller,
                    hitText: "type a message",
                    icon: "assets/img/email.png",
                    obscureText: false,
                  ),),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 94, 5, 121),
                      shape: BoxShape.circle),
                      margin: EdgeInsets.only(right: 25),
                    child: IconButton(
                      onPressed: sendmessage, 
                    icon: const Icon(Icons.arrow_upward,
                     color: Colors.white,)),
                  ),
    
      ],
    ),
  );
 }
}