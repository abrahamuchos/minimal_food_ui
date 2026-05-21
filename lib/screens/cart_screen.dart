import 'package:flutter/material.dart';
import 'package:minimal_food_ui/components/cart_item.dart';
import 'package:minimal_food_ui/data/mock.dart';
import 'package:minimal_food_ui/data/models/item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Item> cartItems = Mock.cartItems;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: cartItems.length,
          itemBuilder: (BuildContext context, int index) {
            return CartItem(
              title: cartItems[index].title,
              price: cartItems[index].price,
              imgSrc: cartItems[index].imageSrc,
              qty: cartItems[index].qty,
            );
          },
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        'My Cart',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.grey[50],
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(
            onPressed: () {},
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(20),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: const Icon(
                Icons.delete_outline_outlined,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
