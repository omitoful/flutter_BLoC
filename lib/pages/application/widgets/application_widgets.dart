import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_app/pages/home/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';

Widget buildPage(int index) {
  List<Widget> _widgets = [
    HomePage(),
    Center(child: Text("Search")),
    Center(child: Text("Course")),
    Center(child: Text("Chat")),
    Center(child: Text("Profile")),
  ];
  return _widgets[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
    label: "buffalo",
    icon: SizedBox(width: 20.w, height: 20.h, child: Image.asset("assets/buffalo.png")),
    activeIcon: SizedBox(
      width: 20.w,
      height: 20.h,
      child: Image.asset("assets/buffalo.png", color: AppColors.primaryElement),
    ),
  ),
  BottomNavigationBarItem(
    label: "cow",
    icon: SizedBox(width: 20.w, height: 20.h, child: Image.asset("assets/cow.png")),
    activeIcon: SizedBox(
      width: 20.w,
      height: 20.h,
      child: Image.asset("assets/cow.png", color: AppColors.primaryElement),
    ),
  ),
  BottomNavigationBarItem(
    label: "crocodile",
    icon: SizedBox(width: 20.w, height: 20.h, child: Image.asset("assets/crocodile.png")),
    activeIcon: SizedBox(
      width: 20.w,
      height: 20.h,
      child: Image.asset("assets/crocodile.png", color: AppColors.primaryElement),
    ),
  ),
  BottomNavigationBarItem(
    label: "horse",
    icon: SizedBox(width: 20.w, height: 20.h, child: Image.asset("assets/horse.png")),
    activeIcon: SizedBox(
      width: 20.w,
      height: 20.h,
      child: Image.asset("assets/horse.png", color: AppColors.primaryElement),
    ),
  ),
  BottomNavigationBarItem(
    label: "pig",
    icon: SizedBox(width: 20.w, height: 20.h, child: Image.asset("assets/pig.png")),
    activeIcon: SizedBox(
      width: 20.w,
      height: 20.h,
      child: Image.asset("assets/pig.png", color: AppColors.primaryElement),
    ),
  ),
];
