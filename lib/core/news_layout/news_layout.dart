// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:news_app_with_clean_architecture/features/news/presentation/pages/business_news_page.dart';
import 'package:news_app_with_clean_architecture/features/news/presentation/pages/science_news_page.dart';
import 'package:news_app_with_clean_architecture/features/news/presentation/pages/sports_news_page.dart';

class NewsBottomNavBar extends StatefulWidget {


  @override
  State<NewsBottomNavBar> createState() => _NewsBottomNavBarState();
}

class _NewsBottomNavBarState extends State<NewsBottomNavBar> {
  int currentIndex = 0;

  List<Widget> screens = [
     BusinessPage(),
     SciencePage(),
     SportsPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News App',
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {currentIndex = index;});
        },
        items: const [
           BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.science),
            label: 'Science',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.sports),
            label: 'Sports',
          ),
        ],
      ),
    );
  }
}
