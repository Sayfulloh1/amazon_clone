import 'package:amazon_clone/controller/services/auth_services/auth_services.dart';
import 'package:amazon_clone/view/auth_screen/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../user/user_persistant_nav_bart/user_bottom_nav_bar.dart';


class SignInLogic extends StatefulWidget {
  const SignInLogic({super.key});

  @override
  State<SignInLogic> createState() => _SignInLogicState();
}

class _SignInLogicState extends State<SignInLogic> {
  checkAuthentication() {
    bool userIsAuthenticated = AuthServices.checkAuthentication();
    userIsAuthenticated ? Navigator.pushAndRemoveUntil(context, PageTransition(
        child: const UserBottomNavBar(), type: PageTransitionType.rightToLeft,),(route) => false,):
    Navigator.pushAndRemoveUntil(context, PageTransition(
      child: const AuthScreen(), type: PageTransitionType.rightToLeft,),(route) => false,);
  }
@override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkAuthentication();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset('assets/images/amazon_logo.png'),
      ),
    );
  }
}
