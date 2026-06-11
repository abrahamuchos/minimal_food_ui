import 'package:flutter/material.dart';
import 'package:minimal_food_ui/core/theme/app_colors.dart';

class CartItem extends StatelessWidget {
  final String title;
  final String imgSrc;

  // final String companyName;
  final String price;
  final int qty;

  const CartItem({
    super.key,
    required this.title,
    // required this.companyName,
    required this.price,
    required this.imgSrc,
    this.qty = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 8,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Image
          Image.asset(
            imgSrc,
            width: 75,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 16),

          // Info product
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'El Mexicano',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: AppColors.primarySwatch.shade500,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          //Action
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            decoration: BoxDecoration(
                color: AppColors.primarySwatch.shade200.withAlpha(20),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              offset: Offset(0, 1),
                            )
                          ]),
                      child: Icon(
                        Icons.remove,
                        size: 12,
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(qty.toString()),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 1),
                          )
                        ]),
                    child: Icon(
                      Icons.add,
                      size: 12,
                    ),
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
