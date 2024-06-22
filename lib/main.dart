import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/services/auth/auth_service.dart';
import 'package:fitness/view/constants/routes.dart';
import 'package:fitness/view/expert_views/nutritionexpert/main_tab_nuexpert.dart';
import 'package:fitness/view/expert_views/sportexpert/main_tab_sportexpert.dart';
import 'package:fitness/view/home/loading_page.dart';
import 'package:fitness/view/login/complete_profile_view.dart';
import 'package:fitness/view/login/signup_view.dart';
import 'package:fitness/view/login/verifyemailview.dart';
import 'package:fitness/view/main_tab/main_tab_view.dart';
import 'package:fitness/view/login/login_view.dart';
import 'package:flutter/material.dart';
import 'common/colo_extension.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> usertype() async {
    final user = Authservice.Firebase().currentUser;
    bool userExistsInUserCollection = false;
    bool userExistsInExpertCollection = false;
    String? id;
    bool type = false;

    if (user != null) {
      QuerySnapshot userSnapshots = await FirebaseFirestore.instance
          .collection('user')
          .where('user_id', isEqualTo: user.id)
          .get();
      if (userSnapshots.docs.isNotEmpty) {
        userExistsInUserCollection = true;
        id = userSnapshots.docs.first.id;
      }

      // Check if user exists in 'expert' collection
      QuerySnapshot expertSnapshots = await FirebaseFirestore.instance
          .collection('expert')
          .where('expert_id', isEqualTo: user.id)
          .get();

      if (expertSnapshots.docs.isNotEmpty) {
        userExistsInExpertCollection = true;
        id = expertSnapshots.docs.first.id;
      }
    }

    if (userExistsInUserCollection) {
      return true;
    } else {
      return false;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness 3 in 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: TColor.primaryColor1,
        fontFamily: "Poppins"
      ),
      home: const Homepage(),
      routes: {
        loginroute: (context) => const LoginView(),
        registerroute: (context) => const SignUpView(),
        verifyemailroute: (context) => const verifyemailview(),
        completeProfileroute: (context) => const CompleteProfileView(),
      },
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  Future<String?> etype() async {
    final user = Authservice.Firebase().currentUser;
    String? id;
    String? type;

    if (user != null) {
      QuerySnapshot expertSnapshots = await FirebaseFirestore.instance
          .collection('expert')
          .where('expert_id', isEqualTo: user.id)
          .get();
      if (expertSnapshots.docs.isNotEmpty) {
        id = expertSnapshots.docs.first.id;
      }

      if (id != null) {
        DocumentSnapshot<Map<String, dynamic>> snapshot =
            await FirebaseFirestore.instance.collection('expert').doc(id).get();
        type = snapshot.get('type');
      }
    }
    return type;
  }

  Future<Map<String, dynamic>> getUserAndType() async {
    bool isUser = await usertype();
    String? type = await etype();
    return {'isUser': isUser, 'type': type};
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Authservice.Firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = Authservice.Firebase().currentUser;

            if (user != null) {
              if (user.isemailverified) {
                return FutureBuilder<Map<String, dynamic>>(
                  future: getUserAndType(),
                  builder: (context, usertypeSnapshot) {
                    if (usertypeSnapshot.connectionState == ConnectionState.waiting) {
                      return const PictureLoadingPage();
                    }

                    if (usertypeSnapshot.hasData) {
                      bool isUser = usertypeSnapshot.data!['isUser'];
                      String? type = usertypeSnapshot.data!['type'];

                      if (isUser) {
                        return const MainTabView(); // Navigate to the user-specific home page
                      } else {
                        if (type == 'Nutrition Expert') {
                          return const MainTabnuexpertView();
                        } else {
                          return const MainTabsportexpertView();
                        }
                      }
                    } else if (usertypeSnapshot.hasError) {
                      return const Center(child: Text("Error occurred"));
                    } else {
                      return const Center(child: Text("No data found"));
                    }
                  },
                );
              } else {
                return const verifyemailview();
              }
            } else {
              return const LoginView();
            }

          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }

  Future<bool> usertype() async {
    final user = Authservice.Firebase().currentUser;
    bool userExistsInUserCollection = false;

    if (user != null) {
      QuerySnapshot userSnapshots = await FirebaseFirestore.instance
          .collection('user')
          .where('user_id', isEqualTo: user.id)
          .get();
      if (userSnapshots.docs.isNotEmpty) {
        userExistsInUserCollection = true;
      }

      QuerySnapshot expertSnapshots = await FirebaseFirestore.instance
          .collection('expert')
          .where('expert_id', isEqualTo: user.id)
          .get();
      if (expertSnapshots.docs.isNotEmpty) {
        userExistsInUserCollection = false;
      }
    }

    return userExistsInUserCollection;
  }
}
