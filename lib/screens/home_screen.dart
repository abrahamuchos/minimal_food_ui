import 'package:flutter/material.dart';
import 'package:minimal_food_ui/components/category_item.dart';
import 'package:minimal_food_ui/components/product_item.dart';
import 'package:minimal_food_ui/core/theme/app_colors.dart';
import 'package:minimal_food_ui/data/mock.dart';
import 'package:minimal_food_ui/utils/string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(),
            //Categories
            buildCategories(),
            //Promotional Banner
            buildPromotionalBanner(),
            SizedBox(
              height: 15,
            ),
            //Best Sellers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Best Sellers',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: AppColors.primarySwatch.shade500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            //Best Sellers Items
            GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.64,
                ),
                itemCount: Mock.products.length,
                itemBuilder: (context, index) {
                  final product = Mock.products[index];
                  return ProductItem(
                    title: product.title,
                    price: product.price,
                    time: product.time,
                    imgSrc: product.images.first,
                  );
                }),
          ],
        ),
      ),
    );
  }

  Container buildPromotionalBanner() {
    return Container(
      width: double.infinity,
      // height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primarySwatch.shade500,
            AppColors.primarySwatch.shade400,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primarySwatch.shade500.withAlpha(70),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(children: [
        Positioned(
          right: -20,
          top: -20,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withAlpha(35),
            ),
          ),
        ),
        Positioned(
          right: -15,
          top: -15,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withAlpha(35),
            ),
          ),
        ),
        Positioned(
          left: 55,
          top: 55,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withAlpha(25),
            ),
          ),
        ),
        //Content
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Info and CTA
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(100),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(
                        'limited offer'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      '30% off'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'On your first order',
                      style: TextStyle(
                        color: Colors.white.withAlpha(230),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //CTA
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.primarySwatch.shade500,
                          backgroundColor: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          )),
                      child: Text('Order Now'),
                    ),
                  ],
                ),
              ),
              //Image
              Expanded(
                flex: 2,
                child: Transform.translate(
                  offset: Offset(15, 42),
                  child: (Image.asset(
                    'assets/images/chef/birthday.png',
                    width: 155,
                  )),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  // Categories Carousel
  SizedBox buildCategories() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Mock.categories.length,
        itemBuilder: (context, index) {
          final categoryItem = Mock.categories[index];
          return Padding(
            padding: EdgeInsets.only(
              right: index == (Mock.categories.length - 1) ? 0 : 16,
            ),
            child: CategoryItem(
              name: categoryItem.name,
              icon: categoryItem.emoji,
            ),
          );
        },
      ),
    );
  }

  /// Header (Greets, name and Icons)
  Padding buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Greets
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello 👋',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  'Abraham Gonzalez',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          //Search and Notifications
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none_outlined,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
