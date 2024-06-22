import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/view/login/welcome_expert.dart';
import 'package:flutter/material.dart';

import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';

class CompleteexpertProfileView extends StatefulWidget {
  const CompleteexpertProfileView({super.key});

  @override
  State<CompleteexpertProfileView> createState() => _CompleteexpertProfileViewState();
}

class _CompleteexpertProfileViewState extends State<CompleteexpertProfileView> {
  TextEditingController txtDate = TextEditingController();
  late final TextEditingController _gender ;
  late final TextEditingController _age ;
  late final TextEditingController _certeficat ;
  late final TextEditingController _experience ;
  late final TextEditingController _spec ;

  @override
  void initState() {
    _gender = TextEditingController();
    _age = TextEditingController();
    _certeficat = TextEditingController();
    _experience = TextEditingController();
    _spec = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _gender.dispose();
    _age.dispose();
    _certeficat.dispose();
    _experience.dispose();
    _spec.dispose() ;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  width: 200,
                  child: Image.asset(
                    "assets/img/welcome.png",
                    width: media.width,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                
                Text(
                  "Let’s complete your profile",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "It will help us to know more about you!",
                  style: TextStyle(color: TColor.gray, fontSize: 12),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                       Container(
                          decoration: BoxDecoration(
                              color: TColor.lightGray,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  width: 50,
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  
                                  child: Image.asset(
                                    "assets/img/type.png",
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.contain,
                                    color: TColor.gray,
                                  )),
                            
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                     
                                    items: ["Sport Trainer", "Nutrition Expert","Phisiotherapist"]
                                        .map((name) => DropdownMenuItem(
                                              value: name,
                                              child: Text(
                                                name,
                                                style: TextStyle(
                                                    color: TColor.gray,
                                                    fontSize: 14),
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                      _spec.text = value.toString();
                                      

                                                });
                                    },
                                    isExpanded: true,
                                    
                                    hint: _spec.text.isEmpty
                                       ? Text(
                                      "Choose Your specialization",
                                      style: TextStyle(
                                      color: TColor.gray,
                                        fontSize: 12),
                                        )
                                        : Text(
                                          _spec.text,
                                       style: TextStyle(
                                       color: TColor.gray,
                                       fontSize: 12),
                                       ),
                                  ),
                                ),
                              ),

                             const SizedBox(width: 8,)

                            ],
                          ),),
                          SizedBox(
                        height: media.width * 0.04,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: TColor.lightGray,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  width: 50,
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  
                                  child: Image.asset(
                                    "assets/img/gender.png",
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.contain,
                                    color: TColor.gray,
                                  )),
                            
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                     
                                    items: ["Male", "Female"]
                                        .map((name) => DropdownMenuItem(
                                              value: name,
                                              child: Text(
                                                name,
                                                style: TextStyle(
                                                    color: TColor.gray,
                                                    fontSize: 14),
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                      _gender.text = value.toString();
                                      

                                                });
                                    },
                                    isExpanded: true,
                                    
                                    hint: _gender.text.isEmpty
                                       ? Text(
                                      "Choose Gender",
                                      style: TextStyle(
                                      color: TColor.gray,
                                        fontSize: 12),
                                        )
                                        : Text(
                                          _gender.text,
                                       style: TextStyle(
                                       color: TColor.gray,
                                       fontSize: 12),
                                       ),
                                  ),
                                ),
                              ),

                             const SizedBox(width: 8,)

                            ],
                          ),),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      RoundTextField(
                        controller: _age,
                        hitText: "Your Age",
                        icon: "assets/img/date.png",
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              controller: _certeficat,
                              hitText: " Any Certeficate Or Diplomat !",
                              icon: "assets/img/diplome.png",
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              controller: _experience,
                              hitText: "Any Experiences !",
                              icon: "assets/img/experience.png",
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.07,
                      ),
                      RoundButton(
                          title: "Next >",
                          onPressed: () async {
                            User? user = FirebaseAuth.instance.currentUser;          
                           String userId = user!.uid;

                         QuerySnapshot snapshot = await FirebaseFirestore.instance
                          .collection('expert')
                          .where('expert_id', isEqualTo: userId)
                           .get();
                           DocumentSnapshot userDoc = snapshot.docs.first;
                           String id = userDoc.id;
                            
                                                     
                            final gender = _gender.text;                           
                            final age = _age.text;                            
                            final certeficat = _certeficat.text;                            
                            final experience = _experience.text ;
                            final spec = _spec.text ;
                            
                            print('\x1B[31mHello,$gender\x1B[0m');
                            final userDocRef = FirebaseFirestore.instance.collection('expert').doc(id);
                            await userDocRef.update({
                              'type' : spec ,
                             'gender': gender,
                            'age': age,
                            'certeficat': certeficat,
                            'experience': experience,
                            'newlog' : false,
    });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WelcomeexpertView()));
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
