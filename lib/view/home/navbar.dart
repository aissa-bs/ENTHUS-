import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/services/auth/auth_service.dart';
import 'package:fitness/utilities/dialog/logout_dialog.dart';
import 'package:fitness/view/chats/chatsview.dart';
import 'package:fitness/view/constants/routes.dart';
import 'package:fitness/view/profile/about_us.dart';
import 'package:fitness/view/profile/contactus.dart';
import 'package:fitness/view/profile/personal_data.dart';
import 'package:fitness/view/profile/privacypolicy.dart';
import 'package:fitness/view/profile/profile_view.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
   String _firstName = ''; 
   String _lastName = '';
   String _email = '';
   String _gender= '';
   @override
  void initState() {
    fetchUserData();
    super.initState();
  }
  Future<void> fetchUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;          
                           String userId = user!.uid;

                         QuerySnapshot snapshots = await FirebaseFirestore.instance
                          .collection('user')
                          .where('user_id', isEqualTo: userId)
                           .get();
                           DocumentSnapshot userDoc = snapshots.docs.first;
                           String id = userDoc.id;
      
                      String? email = user.email ;
                            
      // Query Firestore to get the user document
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('user').doc(id).get(); // Replace 'user_id_here' with the actual user ID

      // Extract first name and last name from the document data
      String firstName = snapshot.get('firstname');
      String lastName = snapshot.get('lastname');
      String gender = snapshot.get('gender');
      
      // Update state with the fetched data
      setState(() {
        _firstName = firstName;
        _lastName = lastName;
        _email = email! ;
        _gender = gender ;
      });
    } catch (error) {
      // Handle errors here (e.g., show error message)
      print('Error fetching user data: $error');
    }
  }





  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child : ListView(
        padding: EdgeInsets.zero,
        children :  [
        UserAccountsDrawerHeader(accountName:  Text('$_firstName $_lastName', style: const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  ),),
         accountEmail:  Text(_email,style: const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  ),),
         currentAccountPicture: CircleAvatar(
          child: ClipOval(
       child: _getImage()
)
         ),
         decoration: const BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(image: AssetImage("assets/img/fh.jfif"),
          fit: BoxFit.cover
          )
         ),
         ),
         ListTile(
          leading: const Icon(Icons.account_circle),
          title: const Text('Profile '),
          onTap: () {
            Navigator.push(
                           context,
                           MaterialPageRoute(
                           builder: (context) =>  const ProfileView(),
                           ),
                         );
            
          }         
         ),
          ListTile(
          leading: const Icon(Icons.data_saver_off),
          title: const Text('personal data '),
          onTap: () {
            Navigator.push(
                           context,
                           MaterialPageRoute(
                           builder: (context) =>  PersonalDataPage(),
                           ),
                         );
          }         
         ),
          ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings '),
          onTap: () {
            
          }         
         ),
         ListTile(
          leading: const Icon(Icons.chat),
          title: const Text('Chats '),
          onTap: () {
            Navigator.push(
                           context,
                           MaterialPageRoute(
                           builder: (context) =>  const Chatsview(),
                           ),
                         );
          }         
         ),
         const Divider(),
          ListTile(
          leading: const Icon(Icons.policy),
          title: const Text('Privacy policy '),
          onTap: () {
            Navigator.push(
                           context,
                           MaterialPageRoute(
                           builder: (context) =>  PrivacyPolicyPage(),
                           ),
                         );
          }         
         ),
         
          ListTile(
          leading: const Icon(Icons.contact_page),
          title: const Text('Contact Us '),
          onTap: () {
            Navigator.push(
                           context,
                           MaterialPageRoute(
                           builder: (context) =>  ContactUsView(),
                           ),
                         );
          }         
         ),
         
         
          ListTile(
          leading: const Icon(Icons.info),
          title: const Text('About Us '),
          onTap: () {
            Navigator.push(
                           context,
                           MaterialPageRoute(
                           builder: (context) =>  AboutPage(),
                           ),
                         );
          }         
         ),
         const Divider(),
         
          ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () async {
            final shouldlogout = await showlogoutdialog(context);
            
            if(shouldlogout){
              await Authservice.Firebase().logout();
              
              Navigator.of(context).pushNamedAndRemoveUntil(
                loginroute,
                (_) => false,
               );

               }
          }         
         ),
      ],
      )
      





    );
  }
  Widget _getImage() {
  
     if(_gender == 'Male'){
      return Image.asset("assets/img/ml.png");
     }else{
     if(_gender == 'Female'){
      return Image.asset("assets/img/fm.png");
     }else{
      return Image.asset("assets/img/anonyme.png");

     }
     }
      
  }
}
