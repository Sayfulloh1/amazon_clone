import 'package:amazon_clone/controller/services/auth_services/auth_services.dart';
import 'package:flutter/material.dart';

import '../../constants/common_functions.dart';
import '../../utils/colors.dart';
import 'auth_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.mobileNumber});
  final String mobileNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: Image.asset(
          'assets/images/amazon_logo.png',
          height: height * 0.06,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * .03,
              vertical: height * .02,
            ),
            height: height,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Authentication required',
                  style: textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CommonFunctions.blankSpace(height * .01, 0),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: widget.mobileNumber,
                        style: textTheme.displayMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' Change',
                        style: textTheme.displayMedium,
                      ),
                    ],
                  ),
                ),
                CommonFunctions.blankSpace(height * .02, 0),
                Text(
                  'We have send a One Time Password (OTP) to the mobile no. above. Please enter it to complete verification.',
                  style: textTheme.bodyMedium,
                ),
                CommonFunctions.blankSpace(height * .02, 0),
                TextFormField(
                  controller: otpController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: secondaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: grey),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: grey),
                    ),
                    hintText: 'Enter OTP',
                  ),
                ),
                CommonFunctions.blankSpace(height * .02, 0),
                CommonAuthButton(
                  title: 'Continue',
                  btnWidth: .94,
                  onPressed: () {
                    AuthServices.verifyOTP(context: context, otp: otpController.text.trim());
                  },
                ),
                CommonFunctions.blankSpace(height * .02, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend OTP',
                        style: textTheme.bodyMedium!.copyWith(color: blue),
                      ),
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(height * .02, 0),
                BottomAuthScreenWidget(
                    width: width, height: height, textTheme: textTheme),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
