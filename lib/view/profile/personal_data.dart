import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:fitness/common/colo_extension.dart';

class PersonalDataPage extends StatefulWidget {
  @override
  _PersonalDataPageState createState() => _PersonalDataPageState();
}
class _PersonalDataPageState extends State<PersonalDataPage> {
  String _firstName = ''; 
  String _lastName = '';
  String _age = '';
  String _weight = '';
  String _height = '';
  String _phone = '';
  String _gender = '';
  String _email = '';
  String _certeficat = '';
  String _experience = '';
  bool userExistsInUserCollection = false;
          bool userExistsInExpertCollection = false;
   @override
  void initState() {
    fetchUserData();
    super.initState();
  }
  
 Future<void> fetchUserData() async {
    try {
      final user = Authservice.Firebase().currentUser ;
            
          String? id;

  QuerySnapshot userSnapshots = await FirebaseFirestore.instance
      .collection('user')
      .where('user_id', isEqualTo: user?.id)
      .get();
  if (userSnapshots.docs.isNotEmpty) {
    userExistsInUserCollection = true;
    id = userSnapshots.docs.first.id;
  }

  // Check if user exists in 'expert' collection
  QuerySnapshot expertSnapshots = await FirebaseFirestore.instance
      .collection('expert')
      .where('expert_id', isEqualTo: user?.id)
      .get();
  if (expertSnapshots.docs.isNotEmpty) {
    userExistsInExpertCollection = true;
    id = expertSnapshots.docs.first.id;
  }
                        
      
      String? email = user?.email ;
                            
      // Query Firestore to get the user document
      if(userExistsInUserCollection) {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('user').doc(id).get(); // Replace 'user_id_here' with the actual user ID

      // Extract first name and last name from the document data
      String firstName = snapshot.get('firstname');
      String lastName = snapshot.get('lastname');
      String gender = snapshot.get('gender'); 
      String height = snapshot.get('height').toString();
      String weight = snapshot.get('weight').toString();
      String Phone= snapshot.get('phone');
      String age = snapshot.get('age').toString();
       setState(() {
        _firstName = firstName;
        _lastName = lastName;
        _email = email! ;
        _gender = gender ;
        _phone = Phone ;
        _height= height ;
        _weight = weight ;
        _age = age ;

      });}
      if(userExistsInExpertCollection) {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('expert').doc(id).get(); // Replace 'user_id_here' with the actual user ID

      // Extract first name and last name from the document data
      String firstName = snapshot.get('firstname');
      String lastName = snapshot.get('lastname');
      String gender = snapshot.get('gender'); 
      String Phone= snapshot.get('phone');
      String age = snapshot.get('age');
      String experience= snapshot.get('experience');
      String certeficat = snapshot.get('certeficat');
       setState(() {
        _age = age ;
        _phone = Phone ;
        _firstName = firstName;
        _lastName = lastName;
        _email = email! ;
        _gender = gender ;
        _certeficat = certeficat ;
        _experience = experience ;
      });}
      
      // Update state with the fetched data
     
    } catch (error) {
      // Handle errors here (e.g., show error message)
      print('Error fetching user data: $error');
    }
  }







  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Personal Data",
          style: TextStyle(color: TColor.primaryColor1),
        ),
        backgroundColor: TColor.white,
        iconTheme: IconThemeData(color: TColor.black),
      ),
      backgroundColor: TColor.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildPersonalInfoBox(),
            SizedBox(height: 16),
            _buildMembershipInfoBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalInfoBox() {
  return Card(
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Personal Information",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: TColor.primaryColor1,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoItem("First Name", _firstName),
          _buildInfoItem("Last Name", _lastName),
          _buildInfoItem("Age", _age),
          _buildInfoItem("Gender", _gender),
          if(userExistsInUserCollection)
            _buildInfoItem("Height", _height),
          if(userExistsInExpertCollection)
           _buildInfoItem("Certeficat", _certeficat),
           if(userExistsInUserCollection)
          _buildInfoItem("Weight", _weight),
          if(userExistsInExpertCollection)
          _buildInfoItem("Experience", _experience),
          _buildInfoItem("Phone Number", _phone),
          _buildInfoItem("Email", _email),
        ],
      ),
    ),
  );
}

  Widget _buildMembershipInfoBox() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Membership Information",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: TColor.primaryColor1,
              ),
            ),
            SizedBox(height: 16),
            _buildInfoItem("Date of Joining", "January 1, 2024"),
            _buildInfoItem("Membership Rank", "Super"),
            _buildInfoItem("Status", "Premium"),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}