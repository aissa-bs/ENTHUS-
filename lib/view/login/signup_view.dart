import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:fitness/common_widget/round_textfield.dart';
import 'package:fitness/services/auth/auth_exception.dart';
import 'package:fitness/services/auth/auth_service.dart';
import 'package:fitness/utilities/dialog/error_dialog.dart';
import 'package:fitness/view/constants/routes.dart';
import 'package:fitness/view/login/login_view.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
   late final TextEditingController _email ;
   late final TextEditingController _password ;
   late final TextEditingController _firstname ;
   late final TextEditingController _lastname ;
   late final TextEditingController _phone ;
   late final TextEditingController _signas ;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


@override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _firstname = TextEditingController();
    _lastname = TextEditingController();
    _phone = TextEditingController();
    _signas = TextEditingController();

    super.initState();
  }

@override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _firstname.dispose();
    _lastname.dispose();
    _phone.dispose();
    _signas.dispose();
    super.dispose();
  }



  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Hey there,",
                    style: TextStyle(color: TColor.gray, fontSize: 16),
                  ),
                  Text(
                    "Create an Account",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
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
                                      "assets/img/type.png",
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.contain,
                                      color: TColor.gray,
                                    )),
                              
                                Expanded(
                                  child: FormField<String>(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an option';
                  }
                  return null;
                },
                         builder: (FormFieldState<String> state) {
                          
                                    return DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                                                               
                                        items: ["User", "Expert"]
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
                                          _signas.text = value.toString();
                                          
                                                  
                                                    });
                                        },
                                        isExpanded: true,
                                        
                                        hint: _signas.text.isEmpty
                                           ? Text(
                                          "Sign As ... ",
                                          style: TextStyle(
                                          color: TColor.gray,
                                            fontSize: 12),
                                            )
                                            : Text(
                                              _signas.text,
                                           style: TextStyle(
                                           color: TColor.gray,
                                           fontSize: 12),
                                           ),
                                           
                                      ),
                                    );},
                                  ),
                                ),
              
                               const SizedBox(width: 8,)
              
                              ],
                            ),),
                    SizedBox(
                    height: media.width * 0.05,
                  ),            
                   RoundTextField(
                    controller: _firstname,
                    hitText: "First Name",
                    icon: "assets/img/user_text.png",
                    
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                   RoundTextField(
                    controller: _lastname,
                    hitText: "Last Name",
                    icon: "assets/img/user_text.png",
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                   RoundTextField(
                    controller: _phone,
                    hitText: "phone",
                    icon: "assets/img/phone.png",
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                    RoundTextField(
                    controller:  _email,
                    hitText: "Email",
                    icon: "assets/img/email.png",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  RoundTextField(
                    controller:  _password,
                    hitText: "Password",
                    icon: "assets/img/lock.png",
                    obscureText: true,
                    rigtIcon: TextButton(
                        onPressed: () {},
                        child: Container(
                            alignment: Alignment.center,
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              "assets/img/show_password.png",
                              width: 20,
                              height: 20,
                              fit: BoxFit.contain,
                              color: TColor.gray,
                            ))),
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isCheck = !isCheck;
                          });
                        },
                        icon: Icon(
                          isCheck
                              ? Icons.check_box_outlined
                              : Icons.check_box_outline_blank_outlined,
                          color: TColor.gray,
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child:  Text(
                            "By continuing you accept our Privacy Policy and\nTerm of Use",
                            style: TextStyle(color: TColor.gray, fontSize: 10),
                          ),
                       
                      )
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.4,
                  ),
                  RoundButton(title: "Register", onPressed: () async {
                    
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Save the program here
                      Navigator.pop(context);
                    }
                  
                        final email = _email.text;
                        final password = _password.text;
                        final firstname = _firstname.text;
                        final lastname = _lastname.text;
                        final phone = _phone.text;
                        final signas = _signas.text;
                        print('\x1B[31m$signas\x1B[0m');
                  if(signas.isEmpty){
                    showerrordialog(context, "please select sign as option");

                  }else{
                    if(signas == 'user') {
                  try{ await Authservice.Firebase().creatuser(
                    email: email,
                     password: password, 
                     firstname: firstname, lastname: lastname, phone: phone);
                     final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('user').get();
                              final doc = snapshot.docs.first;
                              final id = doc.id;
                              final userDocRef = FirebaseFirestore.instance.collection('user').doc(id);
                              await userDocRef.update({
                                'newlog': true ,
                                                      });
              
                  Navigator.of(context).pushNamed(
                verifyemailroute, );
                Authservice.Firebase().sendemailverification();
                } on Weakpasswordauthexception{
                  showerrordialog(context, "weak password");
                } on Emailusedauthexception{
                  showerrordialog(context, "Email allredy used");
              
                } on Invalidemailauthexception{
                  showerrordialog(context, "invalid email adress");
              
                } on Genericauthexception{
                  await showerrordialog(context, 
                      'auth error',);
              
                } 
                } else{
                  try{ await Authservice.Firebase().createxpert(
                    email: email,
                     password: password, 
                     firstname: firstname, lastname: lastname, phone: phone);
                     final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('expert').get();
                              final doc = snapshot.docs.first;
                              final id = doc.id;
                              final userDocRef = FirebaseFirestore.instance.collection('expert').doc(id);
                              await userDocRef.update({
                                'newlog': true ,
                                                      });
              
                  Navigator.of(context).pushNamed(
                verifyemailroute, );
                Authservice.Firebase().sendemailverification();
                } on Weakpasswordauthexception{
                  showerrordialog(context, "weak password");
                } on Emailusedauthexception{
                  showerrordialog(context, "Email allredy used");
              
                } on Invalidemailauthexception{
                  showerrordialog(context, "invalid email adress");
              
                } on Genericauthexception{
                  await showerrordialog(context, 
                      'auth error',);
              
                } 

                }
                
                
                }
                       
                       
                 },
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.,
                    children: [
                      Expanded(
                          child: Container(
                        height: 1,
                        color: TColor.gray.withOpacity(0.5),
                      )),
                      Text(
                        "  Or  ",
                        style: TextStyle(color: TColor.black, fontSize: 12),
                      ),
                      Expanded(
                          child: Container(
                        height: 1,
                        color: TColor.gray.withOpacity(0.5),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: TColor.white,
                            border: Border.all(
                              width: 1,
                              color: TColor.gray.withOpacity(0.4),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(
                            "assets/img/google.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
              
                       SizedBox(
                        width: media.width * 0.04,
                      ),
              
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: TColor.white,
                            border: Border.all(
                              width: 1,
                              color: TColor.gray.withOpacity(0.4),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(
                            "assets/img/facebook.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  TextButton(
                    onPressed: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginView()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                              color: TColor.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
