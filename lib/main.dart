
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/auth_screen/otp_screen.dart';
import 'package:amazon_clone/view/auth_screen/signinLogic.dart';
import 'package:amazon_clone/view/user/user_persistant_nav_bart/user_bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controller/provider/address_provider.dart';
import 'controller/provider/deal_of_the_day_provider/deal_of_the_day_provider.dart';
import 'controller/provider/product_by_category_provider/product_by_category_provider.dart';
import 'controller/provider/product_provider/product_provider.dart';
import 'controller/provider/rating_provider/rating_provider.dart';
import 'controller/provider/users_product_provider/users_product_provider.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/provider/auth_provider/auth_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProviderr>(create: (_) => AuthProviderr()),
        ChangeNotifierProvider<AddressProvider>(
            create: (_) => AddressProvider()),
        ChangeNotifierProvider<SellerProductProvider>(
            create: (_) => SellerProductProvider()),
        ChangeNotifierProvider<UsersProductProvider>(
            create: (_) => UsersProductProvider()),
        ChangeNotifierProvider<DealOfTheDayProvider>(
            create: (_) => DealOfTheDayProvider()),
        ChangeNotifierProvider<ProductsBasedOnCategoryProvider>(
            create: (_) => ProductsBasedOnCategoryProvider()),
        ChangeNotifierProvider<RatingProvider>(
            create: (_) => RatingProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: const SignInLogic(),
        ),
      );
  }
}
