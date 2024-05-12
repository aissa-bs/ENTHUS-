import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      String age = snapshot.get('age').toString();
      String height = snapshot.get('height').toString();
      String weight = snapshot.get('weight').toString();
      String phone = snapshot.get('phone').toString();

      // Update state with the fetched data
      setState(() {
        _firstName = firstName;
        _lastName = lastName;
        _age = age ;
        _height = height ;
        _weight = weight ;
        _phone = phone ;
        _gender = gender ;
        _email = email! ;
      });
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
          SizedBox(height: 16),
          _buildInfoItem("First Name", _firstName),
          _buildInfoItem("Last Name", _lastName),
          _buildInfoItem("Age", _age),
          _buildInfoItem("Gender", _gender),
          _buildInfoItem("Height", _height),
          _buildInfoItem("Weight", _weight),
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