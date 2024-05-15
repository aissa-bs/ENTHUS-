import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/common/colo_extension.dart';
import 'package:flutter/material.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';

class EditProfileview extends StatefulWidget {
  const EditProfileview({super.key});

  @override
  State<EditProfileview> createState() => _EditProfileviewState();
}

class _EditProfileviewState extends State<EditProfileview> {
  String _firstName1 = ''; 
  String _lastName1 = '';
  String _age1 = '';
  String _weight1 = '';
  String _height1 = '';
  String _phone1 = '';
  String _gender1 = '';
  TextEditingController txtDate = TextEditingController();
  late final TextEditingController _gender ;
  late final TextEditingController _age ;
  late final TextEditingController _weight ;
  late final TextEditingController _height ;
  late final TextEditingController _firstname ;
   late final TextEditingController _lastname ;
   late final TextEditingController _phone ;

  @override
  void initState() {
    _gender = TextEditingController();
    _age = TextEditingController();
    _weight = TextEditingController();
    _height = TextEditingController();
    _firstname = TextEditingController();
    _lastname = TextEditingController();
    _phone = TextEditingController();
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
        _firstName1 = firstName;
        _lastName1 = lastName;
        _age1 = age ;
        _height1 = height ;
        _weight1 = weight ;
        _phone1 = phone ;
        _gender1 = gender ;
      });
    } catch (error) {
      // Handle errors here (e.g., show error message)
      print('Error fetching user data: $error');
    }
  }
  @override
  void dispose() {
    _gender.dispose();
    _age.dispose();
    _weight.dispose();
    _height.dispose();
    _firstname.dispose();
    _lastname.dispose();
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
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
              "assets/img/black_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Profile informations",
          style: TextStyle(
              color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
               
                SizedBox(
                  height: media.width * 0.05,
                ),
                Text(
                  "Edit Your Informations Here",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "lets go!",
                  style: TextStyle(color: TColor.gray, fontSize: 12),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      SizedBox(
                  height: media.width * 0.05,
                ),
                 RoundTextField(
                  controller: _firstname,
                  hitText: "Your First Name : $_firstName1",
                  icon: "assets/img/user_text.png",
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                 RoundTextField(
                  controller: _lastname,
                  hitText: "Your Last Name : $_lastName1",
                  icon: "assets/img/user_text.png",
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                 RoundTextField(
                  controller: _phone,
                  hitText: "Your phone : $_phone1",
                  icon: "assets/img/phone.png",
                ),
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
                                      "Your Gender : $_gender1",
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
                        hitText: "Your Age : $_age1",
                        icon: "assets/img/date.png",
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              controller: _weight,
                              hitText: "Your Weight : $_weight1",
                              icon: "assets/img/weight.png",
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: TColor.secondaryG,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "KG",
                              style:
                                  TextStyle(color: TColor.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              controller: _height,
                              hitText: "Your Height : $_height1",
                              icon: "assets/img/hight.png",
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: TColor.secondaryG,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "CM",
                              style:
                                  TextStyle(color: TColor.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.07,
                      ),
                      
                      RoundButton(  
                          title: "Done >",
                          onPressed: () async {
                            User? user = FirebaseAuth.instance.currentUser;          
                           String userId = user!.uid;
                            QuerySnapshot snapshots = await FirebaseFirestore.instance
                          .collection('user').where('user_id', isEqualTo: userId)
                           .get();
                           DocumentSnapshot userDoc = snapshots.docs.first;
                           String id = userDoc.id;
                            String firstname = '';
                            String lastname = ''; 
                            String phone = '';                
                            String gender = '';                           
                            String age = '';                            
                            String weight = '';                            
                            String height = '' ;
                            if(_firstname.text.isNotEmpty){
                              firstname = _firstname.text ;
                            }else{
                              firstname = _firstName1 ;
                            }
                            if(_lastname.text.isNotEmpty){
                              lastname = _lastname.text ;
                            }else{
                              lastname = _lastName1 ;
                            }
                            if(_gender.text.isNotEmpty){
                              gender = _gender.text ;
                            }else{
                              gender = _gender1 ;
                            }
                            if(_phone.text.isNotEmpty){
                              phone = _phone.text ;
                            }else{
                              phone = _phone1 ;
                            }
                            if(_age.text.isNotEmpty){
                              age = _age.text ;
                            }else{
                              age = _age1 ;
                            }
                            if(_height.text.isNotEmpty){
                              height = _height.text ;
                            }else{
                              height = _height1 ;
                            }
                            if(_weight.text.isNotEmpty){
                              weight = _weight.text ;
                            }else{
                              weight = _weight1 ;
                            }
                            print('\x1B[31mHello,$gender\x1B[0m');
                            final userDocRef = FirebaseFirestore.instance.collection('user').doc(id);
                            await userDocRef.update({
                              'firstname' : firstname,
                              'lastname' : lastname,
                              'phone' : phone,
                              'gender': gender,
                              'age': age,
                              'weight': weight,
                              'height': height,
    });
                            Navigator.pop(context);
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
