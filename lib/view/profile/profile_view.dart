import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/enums/menu_action.dart';
import 'package:fitness/services/auth/auth_service.dart';
import 'package:fitness/utilities/dialog/logout_dialog.dart';
import 'package:fitness/view/constants/routes.dart';
import 'package:fitness/view/expert_views/expert_profile.dart';
import 'package:fitness/view/profile/About_us.dart';
import 'package:fitness/view/profile/contactus.dart';
import 'package:fitness/view/profile/my_profile_view.dart';
import 'package:fitness/view/profile/personal_data.dart';
import 'package:fitness/view/profile/privacypolicy.dart';
import 'package:fitness/view/profile/setting_page.dart';
import 'package:flutter/material.dart';

import '../../common/colo_extension.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/setting_row.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String _firstName = ''; 
  String _lastName = '';
  String _age = '';
  String _weight = '';
  String _height = '';
  String _gender= '';
   String _email = '';
  bool userExistsInUserCollection = false;
  bool userExistsInExpertCollection = false;
   @override

  @override
  void initState() {
    super.initState();
    // Call a method to fetch user data when the widget is initialized
    fetchUserData();
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
       setState(() {
        _firstName = firstName;
        _lastName = lastName;
        _email = email! ;
        _gender = gender ;
      });}
      if(userExistsInExpertCollection) {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('expert').doc(id).get(); // Replace 'user_id_here' with the actual user ID

      // Extract first name and last name from the document data
      String firstName = snapshot.get('firstname');
      String lastName = snapshot.get('lastname');
      String gender = snapshot.get('gender'); 
       setState(() {
        _firstName = firstName;
        _lastName = lastName;
        _email = email! ;
        _gender = gender ;
      });}
      
      // Update state with the fetched data
     
    } catch (error) {
      // Handle errors here (e.g., show error message)
      print('Error fetching user data: $error');
    }
  }
  bool positive = false;

  List accountArr = [
    {"image": "assets/img/p_personal.png", "name": "Personal Data", "tag": "1"},
    {"image": "assets/img/p_achi.png", "name": "Achievement", "tag": "2"},
    {
      "image": "assets/img/p_activity.png",
      "name": "Activity History",
      "tag": "3"
    },
    {
      "image": "assets/img/p_workout.png",
      "name": "Workout Progress",
      "tag": "4"
    }
  ];

  List otherArr = [
    {"image": "assets/img/p_contact.png", "name": "Contact Us", "tag": "5"},
    {"image": "assets/img/p_privacy.png", "name": "Privacy Policy", "tag": "6"},
    {"image": "assets/img/p_setting.png", "name": "Setting", "tag": "7"},
     {"image": "assets/img/about.png", "name": "About Us", "tag": "8"},
     {"image": "assets/img/exit.png", "name": "Log Out", "tag": "9"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leadingWidth: 0,
        title: Text(
          "Profile",
          style: TextStyle(
              color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          PopupMenuButton<MenuAction>(
           onSelected: (value) async{
          switch (value) {
            case MenuAction.logut:
            final shouldlogout = await showlogoutdialog(context);
            
            if(shouldlogout){
              await Authservice.Firebase().logout();
              
              Navigator.of(context).pushNamedAndRemoveUntil(
                loginroute,
                (_) => false,
               );

               }
              
              break;
           
          } 
          


        }, 
        itemBuilder: (context) { 
          return const [
             PopupMenuItem<MenuAction>
            (value: MenuAction.logut, 
          child: Text("logout"),),
          ];
          
         },
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                "assets/img/more_btn.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: _getImage()
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$_firstName $_lastName',
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "***",
                          style: TextStyle(
                            color: TColor.gray,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 35,
                    child: RoundButton(
                      title: "View Profile",
                      type: RoundButtonType.bgGradient,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      onPressed: () {
                        if(userExistsInUserCollection){
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                           builder: (context) =>  ProfilePage(),
                           ),
                         ); 
                         }else{
                          Navigator.push(
                           context,
                           MaterialPageRoute(
                           builder: (context) =>  ExpertProfilePage(),
                           ),
                         ); 

                         }
                      },
                    ),
                  )
                ],
              ),
              
               
              const SizedBox(
                height: 25,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 2)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account",
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: accountArr.length,
                      itemBuilder: (context, index) {
                        var iObj = accountArr[index] as Map? ?? {};
                        return SettingRow(
                          icon: iObj["image"].toString(),
                          title: iObj["name"].toString(),
                          onPressed: () {
                            switch (iObj["tag"]) {
                          case "1":
                          Navigator.push(
                           context,
                           MaterialPageRoute(
                           builder: (context) =>  PersonalDataPage(),
                           ),
                         );

            
                           break;
                           case "2":
                           
           
                           break;
                           case "3":
            // Handle the action for tag 7
                           break;
         
                                }
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 2)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Notification",
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 30,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/img/p_notification.png",
                                height: 15, width: 15, fit: BoxFit.contain),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Text(
                                "Pop-up Notification",
                                style: TextStyle(
                                  color: TColor.black,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            CustomAnimatedToggleSwitch<bool>(
                              current: positive,
                              values: [false, true],
                              dif: 0.0,
                              indicatorSize: Size.square(30.0),
                              animationDuration:
                                  const Duration(milliseconds: 200),
                              animationCurve: Curves.linear,
                              onChanged: (b) => setState(() => positive = b),
                              iconBuilder: (context, local, global) {
                                return const SizedBox();
                              },
                              defaultCursor: SystemMouseCursors.click,
                              onTap: () => setState(() => positive = !positive),
                              iconsTappable: false,
                              wrapperBuilder: (context, global, child) {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                        left: 10.0,
                                        right: 10.0,
                                        
                                        height: 30.0,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                             gradient: LinearGradient(
                                                colors: TColor.secondaryG),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(50.0)),
                                          ),
                                        )),
                                    child,
                                  ],
                                );
                              },
                              foregroundIndicatorBuilder: (context, global) {
                                return SizedBox.fromSize(
                                  size: const Size(10, 10),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: TColor.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50.0)),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black38,
                                            spreadRadius: 0.05,
                                            blurRadius: 1.1,
                                            offset: Offset(0.0, 0.8))
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ]),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 2)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Other",
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: otherArr.length,
                      itemBuilder: (context, index) {
                        var iObj = otherArr[index] as Map? ?? {};
                        return SettingRow(
                          icon: iObj["image"].toString(),
                          title: iObj["name"].toString(),
                          onPressed: () async {
                            switch (iObj["tag"]) {
                          case "5":
                          Navigator.push(
                           context,
                           MaterialPageRoute(
                           builder: (context) =>  ContactUsView(),
                           ),
                         );

            
                           break;
                           case "6":
                           Navigator.push(
                           context,
                           MaterialPageRoute(
                           builder: (context) =>  PrivacyPolicyPage(),
                           ),
                         );
           
                           break;
                           case "7":
                           Navigator.push(
                           context,
                           MaterialPageRoute(
                           builder: (context) =>  SettingsPage(),
                           ),
                         );
            // Handle the action for tag 7
                           break;
                           case "8":
                           Navigator.push(
                           context,
                           MaterialPageRoute(
                           builder: (context) =>  AboutPage(),
                           ),
                         );
                           break;
                           case "9":
                          final shouldlogout = await showlogoutdialog(context);
            
            if(shouldlogout){
              await Authservice.Firebase().logout();
              
              Navigator.of(context).pushNamedAndRemoveUntil(
                loginroute,
                (_) => false,
               );

               }
                           break;
         
                                }

                          },
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget _getImage() {
  
     if(_gender == 'Male'){
      return Image.asset("assets/img/ml.png",width: 50,
                      height: 50,
                      fit: BoxFit.cover,);
     }else{
     if(_gender == 'Female'){
      return Image.asset("assets/img/fm.png",width: 50,
                      height: 50,
                      fit: BoxFit.cover,);
     }else{
      return Image.asset("assets/img/anonyme.png",width: 50,
                      height: 50,
                      fit: BoxFit.cover,);

     }
     }
      
  }
}
