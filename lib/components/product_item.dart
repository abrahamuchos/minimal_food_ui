import 'package:flutter/material.dart';
import 'package:minimal_food_ui/core/theme/app_colors.dart';
import 'package:minimal_food_ui/utils/text.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String price;
  final String time;
  final String imgSrc;

  const ProductItem({
    super.key,
    required this.title,
    required this.price,
    required this.time,
    required this.imgSrc,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return GestureDetector(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      imgSrc,
                      width: constrains.maxWidth * 0.75,
                      // height: constrains.maxHeight * 0.45,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/images/fallback.png');
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Info (Title and price)
                  Text(
                    TextUtils.truncate(title, 17),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
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
                  SizedBox(
                    height: 5,
                  ),
                  //Icons (Cal and Time)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.local_fire_department_outlined,
                            size: 14,
                          ),
                          Text(
                            '44 Cal',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            size: 14,
                          ),
                          Text(
                            time,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primarySwatch.shade400,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Favorite Icon
            Positioned(
              top: 12,
              right: 15,
              child: GestureDetector(
                onTap: () {
                  //TODO: add logic (wishlist)
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(40),
                        blurRadius: 4
                      )
                    ],
                  ),
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.red,
                    size: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
