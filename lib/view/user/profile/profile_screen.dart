import 'package:amazon_clone/constants/common_functions.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    final List<String> gridTextList = [
      'Your Orders',
      'Buy Again',
      'Your Account',
      'Your Wishlists',
    ];
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width, height * .08),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: width * .003, vertical: height * .001),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: appBarGradientColor,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )),
            child: Row(
              children: [
                Image(
                  image: const AssetImage(
                    'assets/images/amazon_black_logo.png',
                  ),
                  height: height * .04,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    color: black,
                    size: height * .04,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: black,
                    size: height * .04,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: width,
            padding: EdgeInsets.symmetric(vertical: height * .02),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .004),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Hello, ',
                              style: textTheme.displayLarge,
                            ),
                            TextSpan(
                              text: 'Ibroxim',
                              style: textTheme.displayLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      CircleAvatar(
                        radius: height * .04,
                        backgroundColor: greyShade3,
                        child: Icon(
                          CupertinoIcons.profile_circled,
                          size: height * .05,
                          color: grey,
                        ),
                      ),
                    ],
                  ),
                ),
                CommonFunctions.blankSpace(height * .01, 0),
                YourGridBtns(
                    width: width,
                    height: height,
                    gridTextList: gridTextList,
                    textTheme: textTheme),
                UsersOrders(width: width, height: height, textTheme: textTheme),
                CommonFunctions.blankSpace(height * .01, 0),
                CommonFunctions.divider(),
                KeepShopping(width: width, height: height, textTheme: textTheme),
                CommonFunctions.blankSpace(height * .01, 0),
                CommonFunctions.divider(),
                BuyAgain(width: width, height: height, textTheme: textTheme),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KeepShopping extends StatelessWidget {
  const KeepShopping({
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
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * .04, vertical: height * .01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Keep Shopping for',
                style: textTheme.bodySmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Edit',
                      style:
                          textTheme.bodySmall!.copyWith(color: blue),
                    ),
                  ),
                  Text(
                    '|',
                    style: textTheme.bodySmall,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Browsing history',
                      style:
                          textTheme.bodySmall!.copyWith(color: blue),
                    ),
                  ),
                ],
              )
            ],
          ),
          CommonFunctions.blankSpace(height * .01, 0),
          GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: width * .04),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: .9
            ),
            shrinkWrap: true,
            itemCount: 5,

            physics: const PageScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(10),
                        color: greyShade2,
                      ),
                      child:Image.asset('assets/images/menu_pics/16.png',fit: BoxFit.cover,),
                    ),
                  ),
                  Text(' Product',style: textTheme.bodySmall,)
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

class UsersOrders extends StatelessWidget {
  const UsersOrders({
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
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * .04, vertical: height * .01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Orders',
                style:
                    textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: textTheme.bodySmall!.copyWith(color: blue),
                ),
              ),
            ],
          ),
          CommonFunctions.blankSpace(height * .01, 0),
          SizedBox(
            height: height * .17,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: PageScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: width * .02),
                  width: width * .4,
                  height: height * .17,
                  decoration: BoxDecoration(
                    border: Border.all(color: greyShade3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/images/menu_pics/0.png',
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
class BuyAgain extends StatelessWidget {
  const BuyAgain({
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
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * .04, vertical: height * .01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Buy Again',
                style:
                    textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: textTheme.bodySmall!.copyWith(color: blue),
                ),
              ),
            ],
          ),
          CommonFunctions.blankSpace(height * .01, 0),
          SizedBox(
            height: height * .14,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: PageScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: width * .02),
                  width: height * .14,
                  height: height * .14,
                  decoration: BoxDecoration(
                    border: Border.all(color: greyShade3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/images/menu_pics/5.png',
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class YourGridBtns extends StatelessWidget {
  const YourGridBtns({
    super.key,
    required this.width,
    required this.height,
    required this.gridTextList,
    required this.textTheme,
  });

  final double width;
  final double height;
  final List<String> gridTextList;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * .15,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: width * .04),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3.2,
        ),
        shrinkWrap: true,
        itemCount: gridTextList.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: grey),
              borderRadius: BorderRadius.circular(50),
              color: greyShade2,
            ),
            child: Text(
              gridTextList[index],
              style: textTheme.bodyMedium,
            ),
          );
        },
      ),
    );
  }
}
