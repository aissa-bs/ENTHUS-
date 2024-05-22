import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/services/auth/auth_service.dart';
import 'package:fitness/view/profile/edit_profile.dart';
import 'package:fitness/view/profile/personal_data.dart';
import 'package:flutter/material.dart';

class ExpertProfilePage extends StatefulWidget {
  @override
  State<ExpertProfilePage> createState() => _ExpertProfilePageState();
}

class _ExpertProfilePageState extends State<ExpertProfilePage> {
      String _firstName = ''; 
      String _lastName = '';
      String _age = '';
      String _certeficat = '';
      String _experience = '';
      String _gender= '';
      String _phone= '';
      String _email= '';
  final String coverImage = 'assets/img/fh.jfif';

  final String profileImage = 'assets/img/u1.png';

  final String fullName = 'John Doe';

  final String bio = 'im A personal Tainer . Join Me to Better Life Style.';

  final String email = 'johndoe@example.com';

  final String phoneNumber = '+1234567890';

  final String rank = '5.4';

   Future<void> fetchUserData() async {
    try {
      final user = Authservice.Firebase().currentUser ;         
                           String userId = user!.id;

                         QuerySnapshot snapshot = await FirebaseFirestore.instance
                          .collection('expert')
                          .where('expert_id', isEqualTo: userId)
                           .get();
                           DocumentSnapshot userDoc = snapshot.docs.first;
                           String id = userDoc.id;
                           _email = user.email  ;

                            
      // Query Firestore to get the user document
      DocumentSnapshot<Map<String, dynamic>> snapshots =
          await FirebaseFirestore.instance.collection('expert').doc(id).get(); // Replace 'user_id_here' with the actual user ID

      // Extract first name and last name from the document data
      String firstName = snapshots.get('firstname');
      String lastName = snapshots.get('lastname');
      String age = snapshots.get('age');
      String certeficat = snapshots.get('certeficat');
      String experience = snapshots.get('experience');
      String phone = snapshots.get('phone');
      String gender = snapshots.get('gender');

      // Update state with the fetched data
      setState(() {
        _firstName = firstName;
        _lastName = lastName;
        _age = age ;
        _certeficat = certeficat ;
        _experience = experience ;
        _gender = gender ;
        _phone = phone ;

      });
    } catch (error) {
      // Handle errors here (e.g., show error message)
      print('Error fetching user data: $error');
    }
  }
  @override
  void initState() {
    super.initState();
    // Call a method to fetch user data when the widget is initialized
    fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        actions: [
          TextButton.icon(
            icon: Icon(Icons.edit, color: Color.fromARGB(255, 92, 76, 240)),
            label: Text(
              'Edit Profile',
              style: TextStyle(color: const Color.fromARGB(255, 92, 76, 240)),
            ),
            onPressed: () {
              // Navigate to the edit profile page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Editprofileview()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none, // Allows the profile image to overflow
              children: [
                Image.asset(
                  coverImage,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 100, // Adjust this value to control overlap
                  left: MediaQuery.of(context).size.width / 2 - 60, // Center the profile image
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(profileImage),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80), // Space for the profile picture overlap
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      _firstName + ' ' + _lastName,
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 5),
                   Center(
                    child: Text(
                      'Trainer',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      bio,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.email, color: Color.fromARGB(255, 150, 113, 252)),
                    title: const Text('Email'),
                    subtitle: Text(_email),
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone, color: Color.fromARGB(255, 150, 113, 252)),
                    title: const Text('Phone Number'),
                    subtitle: Text(_phone),
                  ),
                  ListTile(
                    leading: const Icon(Icons.collections_bookmark, color: Color.fromARGB(255, 150, 113, 252)),
                    title: const Text('Certeficat / Diplomat'),
                    subtitle: Text(_certeficat),
                  ),
                  ListTile(
                    leading: const Icon(Icons.work_history_sharp, color: Color.fromARGB(255, 150, 113, 252)),
                    title: const Text('Experience'),
                    subtitle: Text(_experience),
                  ),
                  ListTile(
                    leading: const Icon(Icons.star, color: Color.fromARGB(255, 150, 113, 252)),
                    title: const Text('Rank'),
                    subtitle: Text(rank),
                  ),
                  ListTile(
                    leading: TextButton.icon(
            icon: Icon(Icons.more, color: Color.fromARGB(255, 150, 113, 252)),
            label: Text(
              'View More',
              style: TextStyle(color: const Color.fromARGB(255, 150, 113, 252)),
            ),
            onPressed: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PersonalDataPage()),
              );
              // Navigate to the edit profile page
             
            },
          ),
                    
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

