import 'dart:developer';

import 'package:amazon_clone/constants/common_functions.dart';
import 'package:amazon_clone/constants/constants.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController todaysDealsCarouselController = CarouselController();

  headphoneDeals(int index) {
    switch (index) {
      case 0:
        return 'Bose';
      case 1:
        return 'boAt';
      case 2:
        return 'Sony';
      case 3:
        return 'OnePlus';
    }
  }

  clothingDeals(int index) {
    switch (index) {
      case 0:
        return 'Kurtas, sarees & more';
      case 1:
        return 'Tops, dresses & more';
      case 2:
        return 'T-shirt, jeans & more';
      case 3:
        return 'View all';
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width * 1, height * 0.08),
          child: HomePageAppBar(width: width, height: height),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeScreenAddressBar(height: height, width: width),
              CommonFunctions.divider(),
              HomeScreenCategoriesList(
                  height: height, width: width, textTheme: textTheme),
              CommonFunctions.blankSpace(height * .01, 0),
              CommonFunctions.divider(),
              HomeScreenBanner(height: height),
              TodaysDealHomeScreenWidget(
                  width: width,
                  height: height,
                  textTheme: textTheme,
                  todaysDealsCarouselController: todaysDealsCarouselController),
              CommonFunctions.divider(),
              OtherOfferGridWidget(
                title: 'Latest Launches in Headphones ',
                productPicNamesList: headphonesDeals,
                textBtnName: 'Explore More',
                offerFor: 'headphones',
              ),
              CommonFunctions.divider(),
              SizedBox(
                width: width,
                height: width,
                child: Image.asset(
                  'assets/images/offersNsponcered/insurance.png',
                  fit: BoxFit.fill,
                ),
              ),
              CommonFunctions.divider(),
              OtherOfferGridWidget(
                title: 'Minimum 70% Off | Top Offers on Clothing',
                productPicNamesList: clothingDealsList,
                textBtnName: 'See all deals',
                offerFor: 'clothing',
              ),
              CommonFunctions.divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonFunctions.blankSpace(height * .02, 0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .02),
                    child: Text(
                      'Watch Sixer only on miniTV',
                      style: textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    height: height * .4,
                    padding: EdgeInsets.symmetric(
                      horizontal: width * .014,
                      vertical: height * .005,
                    ),
                    decoration: const BoxDecoration(),
                    child: Image.asset(
                      'assets/images/offersNsponcered/sixer.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container OtherOfferGridWidget({
    required String title,
    required String textBtnName,
    required List<String> productPicNamesList,
    required String offerFor,
  }) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * .003, vertical: height * .001),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          CommonFunctions.blankSpace(height * .01, 0),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: todaysDeals.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/images/offersNsponcered/${productPicNamesList[index]}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      offerFor == 'headphones'
                          ? headphoneDeals(index)
                          : clothingDeals(index),
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              );
            },
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              textBtnName,
              style: textTheme.bodyMedium!.copyWith(color: blue),
            ),
          ),
        ],
      ),
    );
  }
}

class TodaysDealHomeScreenWidget extends StatelessWidget {
  const TodaysDealHomeScreenWidget({
    super.key,
    required this.width,
    required this.height,
    required this.textTheme,
    required this.todaysDealsCarouselController,
  });

  final double width;
  final double height;
  final TextTheme textTheme;
  final CarouselController todaysDealsCarouselController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * .03,
          vertical: height * .01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonFunctions.blankSpace(height * .01, 0),
            Text(
              '50%-80% of | Latest deals. ',
              style: textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            CarouselSlider(
              carouselController: todaysDealsCarouselController,
              options: CarouselOptions(
                  height: height * .23, autoPlay: true, viewportFraction: 1),
              items: todaysDeals.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        // color: Colors.amber,
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(
                            'assets/images/todays_deals/$i',
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            CommonFunctions.blankSpace(height * .01, 0),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: red,
                  ),
                  child: Text(
                    'Up to 62% off',
                    style: textTheme.labelMedium!.copyWith(color: white),
                  ),
                ),
                CommonFunctions.blankSpace(0, width * .03),
                Text(
                  'Deal of the Day ',
                  style: textTheme.labelMedium!
                      .copyWith(color: red, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            CommonFunctions.blankSpace(height * .03, 0),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
              ),
              itemCount: todaysDeals.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    log(index.toString());
                    todaysDealsCarouselController.animateToPage(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: greyShade3),
                    ),
                    child: Image.asset(
                      'assets/images/todays_deals/${todaysDeals[index]}',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See all Deals',
                style: textTheme.bodyMedium!.copyWith(color: blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenBanner extends StatelessWidget {
  const HomeScreenBanner({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: height * .23, autoPlay: true, viewportFraction: 1),
      items: carouselPictures.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/carousel_slideshow/$i',
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class HomeScreenCategoriesList extends StatelessWidget {
  const HomeScreenCategoriesList({
    super.key,
    required this.height,
    required this.width,
    required this.textTheme,
  });

  final double height;
  final double width;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * .11,
      width: width,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: width * .01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage(
                    'assets/images/categories/${categories[index]}.png',
                  ),
                  height: height * .07,
                ),
                Text(
                  categories[index],
                  style: textTheme.labelMedium,
                ),
              ],
            ),
          );
        },
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class HomeScreenAddressBar extends StatelessWidget {
  const HomeScreenAddressBar({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .06,
      width: width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: addressBarGradientColor,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      )),
    );
  }
}

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * .03,
        vertical: height * .012,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: appBarGradientColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: width * .8,
            child: TextField(
              onTap: () {
                log('Redirecting you to search product screen');
              },
              cursorColor: black,
              decoration: InputDecoration(
                fillColor: white,
                filled: true,
                hintText: 'Search Amazon.in',
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  color: black,
                  onPressed: () {},
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.camera_alt_sharp,
                    color: Colors.grey,
                  ),
                  color: black,
                  onPressed: () {},
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: width * .03,
                  // vertical: height
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: grey),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: grey),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: grey),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mic,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
