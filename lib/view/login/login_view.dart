import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:fitness/common_widget/round_textfield.dart';
import 'package:fitness/services/auth/auth_exception.dart';
import 'package:fitness/services/auth/auth_service.dart';
import 'package:fitness/utilities/dialog/error_dialog.dart';
import 'package:fitness/view/constants/routes.dart';
import 'package:fitness/view/expert_views/main_tab_expert.dart';
import 'package:fitness/view/login/complet_expert_profile.dart';
import 'package:fitness/view/login/signup_view.dart';
import 'package:fitness/view/main_tab/main_tab_view.dart';
import 'package:fitness/view/on_boarding/started_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
   late final TextEditingController _email ;
   late final TextEditingController _password ;


@override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

@override
  void dispose() {
    _email.dispose();
    _password.dispose();
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
          child: Container(
            height: media.height * 0.9,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hey there,",
                  style: TextStyle(color: TColor.gray, fontSize: 16),
                ),
                Text(
                  "Welcome To Enthus",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Container(
                  height: media.width * 0.4,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: TColor.primaryG),
                      borderRadius: BorderRadius.circular(media.width * 0.075)),
                  child: Stack(alignment: Alignment.center, children: [
                    Image.asset(
                      "assets/img/eBanner.png",
                      height: media.width * 0.4,
                      width: double.maxFinite,
                      fit: BoxFit.fitHeight,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "",
                                style: TextStyle(
                                    color: TColor.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "",
                                style: TextStyle(
                                    color: TColor.white.withOpacity(0.7),
                                    fontSize: 14),
                              ),
                              
                              
                              
                            ],
                          ),
                          
                        ],
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  height: media.width * 0.05,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Forgot your password?",
                      style: TextStyle(
                          color: TColor.gray,
                          fontSize: 10,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
               const Spacer(),
                RoundButton(
                  
                    title: "Login",
                    onPressed: () async {
          final email = _email.text;
          final password = _password.text;

        
         try{
      
           await Authservice.Firebase().login(
              email: email, 
              password: password);
         
            final user = Authservice.Firebase().currentUser ;
            bool userExistsInUserCollection = false;
  bool userExistsInExpertCollection = false;
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
       bool newlog = false  ;

            if(userExistsInUserCollection){
            DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('user').doc(id).get();
           newlog = snapshot.get('newlog');
           if (newlog == false) {
              Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainTabView()));
               } else {
                if(user?.isemailverified ?? false){
              Navigator.push(
                           context,
                           MaterialPageRoute(
                           builder: (context) => const StartedView(),
                           ),
                         );

               }else{
                 Navigator.of(context).pushNamedAndRemoveUntil(
                 verifyemailroute, (route) => false);
                    }

                }

          } 
          if(userExistsInExpertCollection){
            DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('expert').doc(id).get();
           newlog = snapshot.get('newlog');
           if (newlog == false) {
              Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  const MainTabexpertView()));
               } else {
                if(user?.isemailverified ?? false){
              Navigator.push(
                           context,
                           MaterialPageRoute(
                           builder: (context) =>  const CompleteexpertProfileView(),
                           ),
                         );

               }else{
                 Navigator.of(context).pushNamedAndRemoveUntil(
                 verifyemailroute, (route) => false);
                    }

                }
          }

            
            
            

      
         } on Usernotfoundauthexception{
          await showerrordialog(context, 'user not found',);
         } on Wrongpasswordauthexception{
          await showerrordialog(context, 'wrong password',);
         }on Genericauthexception{
          await showerrordialog(context, 'auth error',);


         }
         
        },),
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
                            builder: (context) => const SignUpView()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Don’t have an account yet? ",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Register",
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
    );
  }
}
