import 'package:flutter/material.dart';
import 'package:meet_people/components/my_bottom_navbar.dart';
import 'package:meet_people/helpers/icons&images.dart';
import 'package:meet_people/screens/Chats/chats.dart';
import 'package:meet_people/screens/Dashboard/Dashboard.dart';
import 'package:meet_people/screens/Match/match.dart';
import 'package:meet_people/screens/Profile/profile.dart';

import '../classes/basic_models.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _screens = [
    const Dashboard(),
    const MatchScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  final List<MyBottomBarItems> _items = [
    MyBottomBarItems(AppIcons.exploreIcon, "Explore"),
    MyBottomBarItems(AppIcons.matchIcon, "Match"),
    MyBottomBarItems(AppIcons.chatsIcon, "Chats"),
    MyBottomBarItems(AppIcons.profileIcon, "Profile"),
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[activeIndex],
      bottomNavigationBar: MyBottomNavBar(
          items: _items,
          onChange: (index) => setState(() => activeIndex = index),
          activeIndex: activeIndex),
    );
  }
}
