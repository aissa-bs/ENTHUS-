import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../common/colo_extension.dart';
import '../../common_widget/round_button.dart';
import '../main_tab/main_tab_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
   String _firstName = ''; 
  String _lastName = '';
   @override
  void initState() {
    super.initState();
    // Call a method to fetch user data when the widget is initialized
    fetchUserData();
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
                            
      // Query Firestore to get the user document
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('user').doc(id).get(); // Replace 'user_id_here' with the actual user ID

      // Extract first name and last name from the document data
      String firstName = snapshot.get('firstname');
      String lastName = snapshot.get('lastname');
      // Update state with the fetched data
      setState(() {
        _firstName = firstName;
        _lastName = lastName;
      });
    } catch (error) {
      // Handle errors here (e.g., show error message)
      print('Error fetching user data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Container(
          width: media.width,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
             SizedBox(
                height: media.width * 0.1,
              ),
               Image.asset(
                "assets/img/welcome.png",
                width: media.width * 0.75,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: media.width * 0.1,
              ),
              
              Text(
                
                ' Hello $_firstName  $_lastName',
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "You are all set now, let’s reach your\ngoals together with us",
                textAlign: TextAlign.center,
                style: TextStyle(color: TColor.gray, fontSize: 12),
              ),
             const Spacer(),

               RoundButton(
                  title: "Go To Home",
                  onPressed: () async {
                    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('user').get();
                            final doc = snapshot.docs.first;
                            final id = doc.id;
                            final userDocRef = FirebaseFirestore.instance.collection('user').doc(id);
                            await userDocRef.update({
                              'newlog': false ,
                                                    });


                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainTabView()));
                  }),
               
            ],
          ),
        ),

      ),
    );
  }
}
