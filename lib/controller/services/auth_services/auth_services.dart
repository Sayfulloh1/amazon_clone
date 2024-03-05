import 'dart:developer';

import 'package:amazon_clone/view/auth_screen/signinLogic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../../view/auth_screen/otp_screen.dart';
import '../../provider/auth_provider/auth_provider.dart';


class AuthServices {

  static bool checkAuthentication(){
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if(user != null){
      return true;
    }return false;
  }

  static receiveOTP(
      {required BuildContext context, required String mobileNo}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: mobileNo,
        verificationCompleted: (PhoneAuthCredential credential) {
          log(credential.toString());
        },
        verificationFailed: (FirebaseAuthException exception) {
          log(exception.toString());
        },
        codeSent: (String verificationId, int? resendToken) {
          context.read<AuthProviderr>().updateVerificationId(id: verificationId );
          Navigator.push(
              context,
              PageTransition(
                child: OtpScreen(
                  mobileNumber: mobileNo,
                ),
                type: PageTransitionType.rightToLeft,
              ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (error) {
      log(error.toString());
    }
  }

  static verifyOTP({
    required BuildContext context,
    required String otp,
  }) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: context.read<AuthProviderr>().verificationID,
        smsCode: otp,
      );
      await auth.signInWithCredential(credential);
      Navigator.push(
          context,
          PageTransition(
            child: const SignInLogic(),
            type: PageTransitionType.rightToLeft,
          ));
    } catch (e) {
      log(e.toString());
    }
  }
}
