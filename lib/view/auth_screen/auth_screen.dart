import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../constants/common_functions.dart';
import '../../controller/services/auth_services/auth_services.dart';
import '../../utils/colors.dart';
import '../../utils/theme.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String countryCode = '+998';
  bool inLogin = true;
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
            height: height,
            width: width,
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.03, vertical: height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: theme.textTheme.displaySmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                //
                //
                Builder(
                  builder: (context) {
                    if(inLogin){
                      return SignIn(width, height, context, textTheme);
                    }
                    else{
                      return  CreateAccount(width, height, context, textTheme);
                    }
                  },
                ),
                CommonFunctions.blankSpace(height * .05, 0),
                BottomAuthScreenWidget(
                    width: width, height: height, textTheme: textTheme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container SignIn(
      double width, double height, BuildContext context, TextTheme textTheme) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: greyShade3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: height * .06,
            padding: EdgeInsets.symmetric(horizontal: width * .02),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: greyShade3),
                top: BorderSide(color: greyShade3),
              ),
              color: greyShade1,
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      inLogin = false;
                    });
                  },
                  child: Container(
                    height: height * 0.03,
                    width: height * 0.03,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: grey)),
                    child: Icon(
                      Icons.circle,
                      size: height * 0.01,
                      color: inLogin ? transparent : secondaryColor,
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(0, width * .02),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Create Account',
                        style: theme.textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: ' New to Amazon?',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CommonFunctions.blankSpace(height * .015, 0),
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
                horizontal: width * .02, vertical: height * .01),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          inLogin = true;
                        });
                      },
                      child: Container(
                        height: height * 0.03,
                        width: height * 0.03,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: grey)),
                        child: Icon(
                          Icons.circle,
                          size: height * 0.01,
                          color: inLogin ? secondaryColor : transparent,
                        ),
                      ),
                    ),
                    CommonFunctions.blankSpace(0, width * .02),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Sign in. ',
                            style: theme.textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: 'Already a Customer?',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(height * .01, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          onSelect: (val) {
                            setState(() {
                              countryCode = '+${val.phoneCode}';
                            });
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: grey),
                          borderRadius: BorderRadius.circular(5),
                          color: greyShade1,
                        ),
                        width: width * .2,
                        height: height * .06,
                        alignment: Alignment.center,
                        child: Text(
                          countryCode,
                          style: textTheme.displaySmall!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Container(
                      width: width * .64,
                      height: height * .06,
                      alignment: Alignment.center,
                      child: TextFormField(
                        controller: mobileController,
                        cursorColor: black,
                        style: textTheme.bodySmall,
                        keyboardType: TextInputType.number,
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
                          hintText: 'Mobile Number',
                        ),
                      ),
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(height * .02, 0),
              ],
            ),
          ),
          CommonFunctions.blankSpace(height * .015, 0),
          CommonAuthButton(
            title: 'Continue',
            onPressed: () {
              AuthServices.receiveOTP(
                  context: context,
                  mobileNo:
                  '$countryCode${mobileController.text.trim()}');
            },
            btnWidth: 0.88,
          ),
          CommonFunctions.blankSpace(height * .02, 0),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'By continuing you agree to Amazon\'s ',
                  style: theme.textTheme.labelMedium,
                ),
                TextSpan(
                  text: 'Condition of Use',
                  style: theme.textTheme.labelMedium!.copyWith(color: blue),
                ),
                TextSpan(
                  text: ' and ',
                  style: theme.textTheme.labelMedium,
                ),
                TextSpan(
                  text: ' Privacy Notice',
                  style: theme.textTheme.labelMedium!.copyWith(color: blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container CreateAccount(
      double width, double height, BuildContext context, TextTheme textTheme) {
    const String authText =
        'By enrolling your mobile phone number, you concent to receive automated security notifications via text message from Amazon. \nMessage and data rates may apply.';
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: greyShade3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CommonFunctions.blankSpace(height * .015, 0),
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
                horizontal: width * .02, vertical: height * .01),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          inLogin = false;
                        });
                      },
                      child: Container(
                        height: height * 0.03,
                        width: height * 0.03,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: grey)),
                        child: Icon(
                          Icons.circle,
                          size: height * 0.01,
                          color: inLogin ? transparent : secondaryColor,
                        ),
                      ),
                    ),
                    CommonFunctions.blankSpace(0, width * .02),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Create account. ',
                            style: theme.textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: 'New to Amazon?',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(height * .01, 0),
                Container(
                  width: width,
                  height: height * .06,
                  alignment: Alignment.center,
                  child: TextFormField(
                    controller: nameController,
                    cursorColor: black,
                    style: textTheme.bodySmall,
                    // keyboardType: TextInputType.number,
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
                      hintText: 'First and last name',
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(height * .01, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          onSelect: (val) {
                            setState(() {
                              countryCode = '+${val.phoneCode}';
                            });
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: grey),
                          borderRadius: BorderRadius.circular(5),
                          color: greyShade1,
                        ),
                        width: width * .2,
                        height: height * .06,
                        alignment: Alignment.center,
                        child: Text(
                          countryCode,
                          style: textTheme.displaySmall!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Container(
                      width: width * .64,
                      height: height * .06,
                      alignment: Alignment.center,
                      child: TextFormField(
                        controller: mobileController,
                        cursorColor: black,
                        style: textTheme.bodySmall,
                        keyboardType: TextInputType.number,
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
                          hintText: 'Mobile Number',
                        ),
                      ),
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(height * .02, 0),
                Text(
                  authText,
                  style: textTheme.bodyMedium,
                ),
                CommonFunctions.blankSpace(height * .02, 0),
                CommonAuthButton(
                  title: 'Continue',
                  onPressed: (){},
                  btnWidth: .88,
                ),
                CommonFunctions.blankSpace(height * .02, 0),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By continuing you agree to Amazon\'s ',
                        style: theme.textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: 'Condition of Use',
                        style:
                            theme.textTheme.labelMedium!.copyWith(color: blue),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: theme.textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: ' Privacy Notice',
                        style:
                            theme.textTheme.labelMedium!.copyWith(color: blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: width,
            height: height * .06,
            padding: EdgeInsets.symmetric(horizontal: width * .02),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: greyShade3),
                top: BorderSide(color: greyShade3),
              ),
              color: greyShade1,
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      inLogin = true;
                    });
                  },
                  child: Container(
                    height: height * 0.03,
                    width: height * 0.03,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: grey)),
                    child: Icon(
                      Icons.circle,
                      size: height * 0.01,
                      color: inLogin ? secondaryColor : transparent,
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(0, width * .02),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Sign in',
                        style: theme.textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: ' Already a Customer?',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommonAuthButton extends StatelessWidget {
   CommonAuthButton({
    super.key,
    required this.title,
    required this.onPressed,
     required this.btnWidth,
  });
  String title;
  VoidCallback onPressed;
  double btnWidth;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width * btnWidth, height * .06),
        backgroundColor: amber,
      ),
      child: Text(
        title,
        style: textTheme.displaySmall!
            .copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class BottomAuthScreenWidget extends StatelessWidget {
  const BottomAuthScreenWidget({
    super.key,
    required this.width,
    required this.height,
    required this.textTheme,
  });

  final double width;
  final double height;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 2,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                white,
                greyShade3,
                white,
              ],
            ),
          ),
        ),
        CommonFunctions.blankSpace(height * .02, 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Condition of Use',
              style: textTheme.bodyMedium!.copyWith(color: blue),
            ),
            Text(
              'Privacy Notice',
              style: textTheme.bodyMedium!.copyWith(color: blue),
            ),
            Text(
              'Help',
              style: textTheme.bodyMedium!.copyWith(color: blue),
            ),
          ],
        ),
        CommonFunctions.blankSpace(height * .02, 0),
        Text(
          '© 1996-2024, Amazon.com, Inc. or its affiliates',
          style: textTheme.labelMedium!.copyWith(color: grey),
        ),
      ],
    );
  }
}
