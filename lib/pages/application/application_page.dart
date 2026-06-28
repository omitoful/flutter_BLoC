import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/common/colors.dart';
import 'package:flutter_bloc_app/pages/application/widgets/application_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: buildPage(_selectedIndex),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 58.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.h),
                topRight: Radius.circular(20.h),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                ),
              ],
            ),
            child: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              currentIndex: _selectedIndex,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryElement,
              unselectedItemColor: AppColors.primaryFourElementText,
              backgroundColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                  label: "buffalo",
                  icon: SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: Image.asset("assets/buffalo.png"),
                  ),
                  activeIcon: SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: Image.asset(
                      "assets/buffalo.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "cow",
                  icon: SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: Image.asset("assets/cow.png"),
                  ),
                  activeIcon: SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: Image.asset("assets/cow.png", color: AppColors.primaryElement),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "crocodile",
                  icon: SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: Image.asset("assets/crocodile.png"),
                  ),
                  activeIcon: SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: Image.asset(
                      "assets/crocodile.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "horse",
                  icon: SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: Image.asset("assets/horse.png"),
                  ),
                  activeIcon: SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: Image.asset(
                      "assets/horse.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "pig",
                  icon: SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: Image.asset("assets/pig.png"),
                  ),
                  activeIcon: SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: Image.asset("assets/pig.png", color: AppColors.primaryElement),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
