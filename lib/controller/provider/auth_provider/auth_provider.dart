

import 'package:flutter/material.dart';

class AuthProviderr extends ChangeNotifier{
  String phoneNumber = '';
  String verificationID = '';
  String otp = '';

   updatePhoneNumber({required String num}){
    phoneNumber = num;
    notifyListeners();
  }
   updateVerificationId({required String id}){
    verificationID = id;
    notifyListeners();
  }
}