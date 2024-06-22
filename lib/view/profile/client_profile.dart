import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:fitness/common_widget/title_subtitle_cell.dart';
import 'package:fitness/view/profile/personal_data.dart';
import 'package:flutter/material.dart';

class ClientProfilePage extends StatelessWidget {
  
  final Map wObj;
  const ClientProfilePage({super.key, required this.wObj});
  final String coverImage = 'assets/img/fh.jfif';
  final String profileImage = 'assets/img/u1.png';
  final String fullName = 'John Doe';
  final String bio = 'Sport enthusiast.';
  final String email = 'myprofile@example.com';
  final String phoneNumber = '+1234567890';
  final String rank = 'Beginner';
  final RoundButtonType type = RoundButtonType.bgGradient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        
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
                    backgroundImage: AssetImage(wObj["image"].toString(),),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80), // Space for the profile picture overlap
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                       '${wObj["firstname"]} ${wObj["lastname"]}' ,
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      bio,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Container(
                      height: 40,
                      width: 160,
                      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 1.0), // Add padding
          decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: type == RoundButtonType.bgSGradient ? TColor.secondaryG :  TColor.primaryG,
              ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: type == RoundButtonType.bgGradient ||  type == RoundButtonType.bgSGradient 
              ? const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 0.5,
                      offset: Offset(0, 0.5))
                ]
              : null),
                      child: TextButton.icon(
                                  icon:Image.asset(
                            "assets/img/messengerwh.png",
                            width: 25,
                            height: 25,
                            fit: BoxFit.fitHeight,
                          ),
                                  label: const Text(
                                    'Message',
                                    style: TextStyle(color: Color.fromARGB(255, 246, 245, 255)),
                                  ),
                                  onPressed: () {
                                  },
                                ),
                    ),
                  ),
                  const SizedBox(height: 15),
                 
                   Row(
                    children: [
                      Expanded(
                        child: TitleSubtitleCell(
                          title: wObj["height"].toString(),
                          subtitle: "Height",
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TitleSubtitleCell(
                          title: wObj["weight"],
                          subtitle: "Weight",
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TitleSubtitleCell(
                          title: wObj["age"],
                          subtitle: "Age",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                   Row(children: [
                     Padding(
                       padding: const EdgeInsets.only(right: 50),
                       child: Container(
                        height: 50,
                        width: 160,
                        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 1.0), // Add padding
                                 decoration: BoxDecoration(
                                 gradient: LinearGradient(
                                     colors: type == RoundButtonType.bgSGradient ? TColor.secondaryG :  TColor.primaryG,
                                     ),
                                 borderRadius: BorderRadius.circular(25),
                                 boxShadow: type == RoundButtonType.bgGradient ||  type == RoundButtonType.bgSGradient 
                                     ? const [
                                         BoxShadow(
                        color: Colors.black26,
                        blurRadius: 0.5,
                        offset: Offset(0, 0.5))
                                       ]
                                     : null),
                        child: TextButton.icon(
                                    icon:Image.asset(
                              "assets/img/program.png",
                              width: 25,
                              height: 25,
                              fit: BoxFit.fitHeight,
                            ),
                                    label: const Text(
                                      'View Programs',
                                      style: TextStyle(color: Color.fromARGB(255, 246, 245, 255),
                                      fontSize: 12
                                      ),
                                    ),
                                    onPressed: () {
                                    },
                                  ),
                                           ),
                     ),
                     Container(
                      height: 50,
                      width: 160,
                      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 1.0), // Add padding
          decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: type == RoundButtonType.bgSGradient ? TColor.secondaryG :  TColor.primaryG,
              ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: type == RoundButtonType.bgGradient ||  type == RoundButtonType.bgSGradient 
              ? const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 0.5,
                      offset: Offset(0, 0.5))
                ]
              : null),
                      child: TextButton.icon(
                                  icon:Image.asset(
                            "assets/img/statistic.png",
                            width: 25,
                            height: 25,
                            fit: BoxFit.fitHeight,
                          ),
                                  label: const Text(
                                    'View Statistics',
                                    style: TextStyle(color: Color.fromARGB(255, 246, 245, 255),
                                    fontSize: 12),
                                  ),
                                  onPressed: () {
                                  },
                                ),
                    ),
                  ],),
                  const SizedBox(height: 20),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.email, color: Color.fromARGB(255, 181, 180, 255)),
                    title: const Text('Email',style: TextStyle(color: Color.fromARGB(255, 83, 83, 83),),),
                    subtitle: Text(email,style: const TextStyle(color: Color.fromARGB(255, 156, 156, 156),),),
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone, color: Color.fromARGB(255, 181, 180, 255)),
                    title: const Text('Phone Number',style: TextStyle(color: Color.fromARGB(255, 83, 83, 83),),),
                    subtitle: Text(phoneNumber,style: const TextStyle(color: Color.fromARGB(255, 156, 156, 156),),),
                  ),
                  ListTile(
                    leading: const Icon(Icons.star, color: Color.fromARGB(255, 181, 180, 255)),
                    title: const Text('Rank',style: TextStyle(color: Color.fromARGB(255, 83, 83, 83),),),
                    subtitle: Text(rank , style: const TextStyle(color: Color.fromARGB(255, 156, 156, 156),),),
                  ),
                  ListTile(
                    leading: TextButton.icon(
            icon: const Icon(Icons.more, color: Color.fromARGB(255, 181, 180, 255)),
            label: const Text(
              'View More',
              style: TextStyle(color: Color.fromARGB(255, 181, 180, 255)),
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

