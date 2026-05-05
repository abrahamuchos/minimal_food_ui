import 'package:flutter/material.dart';
import 'package:minimal_food_ui/utils/string.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String icon;

  const CategoryItem({
    super.key,
    required this.name,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(3),
                spreadRadius: 1,
                blurRadius: 10,
              ),
            ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                icon,
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ),
        Text(
          name.toCapitalize(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Colors.black26,
          ),
        ),
      ],
    );
  }
}
