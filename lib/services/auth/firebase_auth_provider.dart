
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, FirebaseAuthException;
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/firebase_options.dart';
import 'package:fitness/services/auth/auth_exception.dart';
import 'package:fitness/services/auth/auth_provider.dart';
import 'package:fitness/services/auth/auth_user.dart';

class Firebaseauthprovider implements Authprovider {
  
  @override
  Future<Authuser> creatuser({
    required String email, 
    required String password,
    required String firstname,
    required String lastname,
    required String phone,}) async
     {
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
          final user = currentUser ;
          if(user != null){
            final id = currentUser?.id ;
            adduserdetaills(firstname, lastname,id!, phone);

            return user;

          }else{
            throw Usernotlogedinauthexception();
          }
      }on  FirebaseAuthException catch(e){
         if(e.code == 'weak-password'){
            throw Weakpasswordauthexception();
          } else if (e.code == 'email-already-in-use'){
            throw Emailusedauthexception();

          }
          else if (e.code == 'invalid-email'){
            throw Invalidemailauthexception();

          }else{
            throw Genericauthexception();
           }

        }catch (_){ throw Genericauthexception(); }

    
  } 
   @override
  Future<Authuser> createxpert({
    required String email, 
    required String password,
    required String firstname,
    required String lastname,
    required String phone,}) async
     {
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
          final user = currentUser ;
          if(user != null){
            final id = currentUser?.id ;
            addexpertdetaills(firstname, lastname,id!, phone);

            return user;

          }else{
            throw Usernotlogedinauthexception();
          }
      }on  FirebaseAuthException catch(e){
         if(e.code == 'weak-password'){
            throw Weakpasswordauthexception();
          } else if (e.code == 'email-already-in-use'){
            throw Emailusedauthexception();

          }
          else if (e.code == 'invalid-email'){
            throw Invalidemailauthexception();

          }else{
            throw Genericauthexception();
           }

        }catch (_){ throw Genericauthexception(); }

    
  } 
  Future adduserdetaills(String firstname, String lastname,String id,
   String phone ) async{
    await FirebaseFirestore.instance.collection('user').add({
      'firstname' : firstname ,
      'lastname' : lastname ,
      'phone' : phone,
      'user_id' : id ,
    });
  }

  Future adduserdetaills2(String gender, String dateofbirth, int weight , int height ) async{
    await FirebaseFirestore.instance.collection('user').add({
      'gender' : gender,
      'dateofbirth' : dateofbirth,
      'weight' : weight,
      'height' : height,
    });
  }
  Future addexpertdetaills(String firstname, String lastname,String id,
   String phone ) async{
    await FirebaseFirestore.instance.collection('expert').add({
      'firstname' : firstname ,
      'lastname' : lastname ,
      'phone' : phone,
      'expert_id' : id ,
    });
  }
  
  
  @override
  Future completeprofile({
   required String id, 
   required String gender, 
  required String dateofbirth,
  required int weight , 
  required int height 
  }) async{

    await FirebaseFirestore.instance.collection('user').doc(id).update({
      'gender' : gender,
      'dateofbirth' : dateofbirth,
      'weight' : weight,
      'height' : height,
      
    });
    
  }

  



  @override
  Authuser? get currentUser {
    final user = FirebaseAuth.instance.currentUser ;
    if(user != null){
      return Authuser.fromFirebase(user);


    }else{
      return null;


    }
  }

    
  

  @override
  Future<Authuser> login({
    required String email, 
    required String password,}) async{
      try  {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, 
          password: password);
           final user = currentUser ;
          if(user != null){
            return user;

          }else{
            throw Usernotlogedinauthexception();
          }



      }on FirebaseAuthException catch (e){
          if(e.code == 'user-not-found'){
            throw Usernotfoundauthexception();
          }else if(e.code == 'wrong-password'){
            throw Wrongpasswordauthexception();
           }else{
            throw Genericauthexception();
           } 
           } catch(_){ throw Genericauthexception();
           }


  }

  @override
  Future<void> logout() async {
    final user = FirebaseAuth.instance.currentUser;
    if(user != null){
      await FirebaseAuth.instance.signOut();
    }else{
      throw Usernotlogedinauthexception();
    }
  }

  @override
  Future<void> sendemailverification() async{
    final user = FirebaseAuth.instance.currentUser ;
    if( user != null){
      await user.sendEmailVerification();
    }else{
      throw Usernotlogedinauthexception();
    }
  

  }
  
  @override
  Future<void> initialize() async {

await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform
        );

    throw UnimplementedError();
  }

  
}

