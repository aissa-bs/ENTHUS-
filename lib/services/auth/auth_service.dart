


import 'package:fitness/services/auth/auth_provider.dart';
import 'package:fitness/services/auth/auth_user.dart';
import 'package:fitness/services/auth/firebase_auth_provider.dart';

class Authservice implements Authprovider {

  final Authprovider provider ;
  const Authservice(this.provider);
  
  factory Authservice.Firebase() => Authservice(Firebaseauthprovider());
  @override
  Future<Authuser> creatuser({
    required String email, 
    required String password,
    required String firstname,
    required String lastname,
    required String phone,

    }) => provider.creatuser(
  email: email, password: password,
   firstname: firstname, lastname: lastname, phone: phone, );

  @override
  Future<Authuser> createxpert({
    required String email, 
    required String password,
    required String firstname,
    required String lastname,
    required String phone,

    }) => provider.createxpert(
  email: email, password: password,
   firstname: firstname, lastname: lastname, phone: phone, );
   
  @override
  Future completeprofile({
    required String id, 
    required String gender, 
    required String dateofbirth,
    required int weight,
    required int height,
    }) => provider.completeprofile(
      id: id,
      gender: gender,
     dateofbirth: dateofbirth,
      weight: weight,
       height: height, 
   );
  @override
  Authuser? get currentUser => provider.currentUser;
  
  @override
  Future<Authuser> login({required String email, required String password}) 
  => provider.login(email: email, password: password); 
  
  @override
  Future<void> logout() => provider.logout();
  
  @override
  Future<void> sendemailverification() => provider.sendemailverification();
  
  @override
  Future<void> initialize() => provider.initialize(); 
}