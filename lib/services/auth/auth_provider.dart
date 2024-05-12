import 'package:fitness/services/auth/auth_user.dart';


abstract class Authprovider {
  Authuser? get currentUser ;
Future<void> initialize();
  Future<Authuser> login ({
    required String email ,
    required String password 

  });
Future<Authuser> creatuser ({
    required String email ,
    required String password,
    required String firstname,
    required String lastname,
    required String phone,

  });
  Future completeprofile({
    required String id,
    required String gender, 
    required String dateofbirth,
    required int weight,
    required int height,

  });
  Future<void> logout();
  
  Future<void> sendemailverification();




}