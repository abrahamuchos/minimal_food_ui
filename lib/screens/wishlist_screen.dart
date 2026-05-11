import 'package:flutter/material.dart';
import 'package:minimal_food_ui/components/product_item.dart';
import 'package:minimal_food_ui/data/mock.dart';
import 'package:minimal_food_ui/data/models/product.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product?> wishlistProducts = Mock.wishlistProducts;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Wishlist',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey[50],
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: wishlistProducts.isEmpty
              ? Center(
                  child: Text(
                    'No items in your wishlist',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                )
              : GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.64,
                  ),
                  itemCount: wishlistProducts.length,
                  itemBuilder: (context, index) {
                    //TODO: Variable temporal
                    final product = wishlistProducts[index];
                    return ProductItem(
                      title: product!.title,
                      price: product.price,
                      time: product.time,
                      imgSrc: product.images.first,
                    );
                  },
                )),
    );
  }
}
