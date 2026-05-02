import 'package:flutter/material.dart';
import 'package:minimal_food_ui/core/theme/app_colors.dart';
import 'package:minimal_food_ui/screens/cart_screen.dart';
import 'package:minimal_food_ui/screens/home_screen.dart';
import 'package:minimal_food_ui/screens/wishlist_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(),
          WishlistScreen(),
          CartScreen(),
        ],
      ),
      //Navbar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 24,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.07),
                blurRadius: 16,
                offset: const Offset(0, 4),
              )
            ]
          ),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavBarItem(
                icon: Icons.home,
                selected: _selectedIndex == 0,
                onTap: () {
                  setState(() => _selectedIndex = 0);
                },
              ),
              _NavBarItem(
                icon: Icons.favorite_border_outlined,
                selected: _selectedIndex == 1,
                onTap: () {
                  setState(() => _selectedIndex = 1);
                },
              ),
              _NavBarItem(
                icon: Icons.shopping_cart_outlined,
                selected: _selectedIndex == 2,
                onTap: () {
                  setState(() => _selectedIndex = 2);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _NavBarItem({
    super.key,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = selected ? AppColors.secondary : Colors.grey.shade400;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: selected
            ? BoxDecoration(
                color: AppColors.secondary.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              )
            : null,
        padding: const EdgeInsets.all(10),
        child: Icon(
          icon,
          color: color,
          size: 28,
        ),
      ),
    );
  }
}
