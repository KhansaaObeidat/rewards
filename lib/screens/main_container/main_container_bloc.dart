import 'package:flutter/material.dart';
import 'package:rewards_app/screens/main_container/profile/profile_screen.dart';
import 'package:rewards_app/screens/main_container/rewards/rewards_screen.dart';
import 'package:rewards_app/screens/main_container/score/score_screen%20.dart';

import 'home/home_screen.dart';

class MainContainerBloc{ 
  // tab bar step 2
  int activeIndex = 0;
    // tab bar step 3 and import material package

  TabController? controller;
final ValueNotifier<int> currentTabIndexNotifer=ValueNotifier<int>(0) ;
List<Widget> navTabs=[const HomeScreen(),const ProfileScreen(),const RewardsScreen(),const ScoreScreen()];
}