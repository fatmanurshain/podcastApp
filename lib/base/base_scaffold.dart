import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final bool showBottomNav;
  final int currentIndex;
  final void Function(int)? onBottomNavTap;

  const BaseScaffold({
    this.title = "",
    required this.body,
    this.showBottomNav = false,
    this.currentIndex = 0,
    this.onBottomNavTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title.isNotEmpty
          ? AppBar(
              title: Text(
                title,
              ),
              centerTitle: true,
              elevation: 0,
            )
          : null,
      body: body,
      bottomNavigationBar: showBottomNav
          ? BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: onBottomNavTap,
              backgroundColor: const Color.fromARGB(37, 40, 54, 100),
              selectedItemColor: Colors.white,
              unselectedItemColor: const Color.fromARGB(37, 40, 54, 100),
              items: const [
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/icons/discover.png'),
                  ),
                  label: 'Discover',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/icons/library.png'),
                  ),
                  label: 'Library',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/icons/profile.png'),
                  ),
                  label: 'Profile',
                ),
              ],
            )
          : null,
    );
  }
}
