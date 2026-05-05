import 'package:flutter/material.dart';
import 'package:minimal_food_ui/components/category_item.dart';
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
          ],
        ),
      ),
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
