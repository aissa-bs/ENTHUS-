import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/models/message.dart';
import 'package:fitness/services/auth/auth_service.dart';

class Chatservice {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance ;
  final Authservice _authservice = Authservice.Firebase();

  Stream<List<Map<String, dynamic>>> getUserStream(){
    return _firestore.collection("user").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();

        return user;
      }).toList();

    });

  }
   Future<void> sendmessage( String recieverid, message) async{

    final String currentuserid = _authservice.currentUser!.id ; 
    final String currentuseremail = _authservice.currentUser!.email ; 
    final Timestamp timestamp = Timestamp.now();

    Message newmessage = Message(senderid: currentuserid,
     senderemail: currentuseremail,
      recieverid: recieverid, 
      message: message, 
      timestamp: timestamp);

      List<String> ids = [currentuserid, recieverid];
      ids.sort();
      String chatroomid = ids.join("_");

      await _firestore.collection("chat_rooms")
      .doc(chatroomid).collection("messages")
      .add(newmessage.toMap());


    

  }
  Stream<QuerySnapshot> getmessages(String userid, otheruserid){

    List<String> ids = [userid,otheruserid];
    ids.sort();
    String chatroomid = ids.join('_');
    return _firestore.collection("chat_rooms")
    .doc(chatroomid).collection("messages").
    orderBy("timestamp", descending: false).snapshots();
  }




}