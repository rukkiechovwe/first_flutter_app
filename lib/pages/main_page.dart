import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/app_strings.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/styles/app_color.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: AppStrings.favorites,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: AppStrings.add,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: AppStrings.messages,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppStrings.user,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: AppColor.white,
      ),
    );
  }

  final pages = [
    const HomePage(),
    const Center(child: Text(AppStrings.favorites)),
    const Center(child: Text(AppStrings.add)),
    const Center(child: Text(AppStrings.messages)),
    Center(child: ProfilePage()),
  ];
}
