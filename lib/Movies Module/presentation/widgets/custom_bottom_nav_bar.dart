import 'package:flutter/material.dart';
import 'package:movie_app/Movies Module/presentation/screens/search_screen.dart';
import 'package:movie_app/Movies%20Module/presentation/screens/home_screen.dart';
import 'package:movie_app/Movies%20Module/presentation/screens/wish_list_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });

        switch (index) {
          case 0: // Home tab
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MovieScreen()),
            );
            break;
          case 1: // Search tab
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchScreen()),
            );
            break;
          case 2: // Wishlist tab
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WishlistScreen()),
            );
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_outlined), label: 'Wish List'),
      ],
    );
  }
}
