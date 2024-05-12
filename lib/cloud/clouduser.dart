import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
const owneruseridFieldname = 'user_id' ;

@immutable
class Clouduser {
 
  final String documentid ;
  final String owneruserid ;
 

  const Clouduser({required this.documentid,
                   required this.owneruserid,
                  }); 


Clouduser.fromSnapshot(QueryDocumentSnapshot<Map<String,dynamic>> snapshot ) :
documentid = snapshot.id,
owneruserid = snapshot.data()[owneruseridFieldname] ;

}


