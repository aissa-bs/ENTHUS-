import 'package:fitness/common_widget/title_subtitle_cell.dart';
import 'package:fitness/view/profile/edit_profile.dart';
import 'package:fitness/view/profile/personal_data.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String coverImage = 'assets/img/fh.jfif';
  final String profileImage = 'assets/img/u1.png';
  final String fullName = 'John Doe';
  final String bio = 'Flutter Developer and UI/UX Enthusiast.';
  final String email = 'johndoe@example.com';
  final String phoneNumber = '+1234567890';
  final String rank = 'Senior Developer';

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
                      fullName,
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      bio,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: TitleSubtitleCell(
                          title: '1.76',
                          subtitle: "Height",
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TitleSubtitleCell(
                          title: '58',
                          subtitle: "Weight",
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TitleSubtitleCell(
                          title: '23',
                          subtitle: "Age",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.email, color: Color.fromARGB(255, 150, 113, 252)),
                    title: Text('Email'),
                    subtitle: Text(email),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Color.fromARGB(255, 150, 113, 252)),
                    title: Text('Phone Number'),
                    subtitle: Text(phoneNumber),
                  ),
                  ListTile(
                    leading: Icon(Icons.star, color: Color.fromARGB(255, 150, 113, 252)),
                    title: Text('Rank'),
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

