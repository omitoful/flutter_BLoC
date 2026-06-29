import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/common/colors.dart';
import 'package:flutter_bloc_app/common/routes/names.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildProfileAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(color: AppColors.primarySecondaryBackground, height: 1.0),
    ),
    title: Container(
      margin: EdgeInsets.symmetric(horizontal: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 30.w, height: 30.h, child: Image.asset("assets/elephant.png")),
          Text(
            "Profile",
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          GestureDetector(
            child: Container(
              width: 25.w,
              height: 25.h,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/panda-bear.png")),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget profileIconAndEditButton() {
  return Container(
    margin: EdgeInsets.only(top: 20.h),
    padding: EdgeInsets.only(right: 5.w),
    alignment: Alignment.bottomRight,
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
      color: Colors.lightBlue,
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(
        image: AssetImage("assets/panda-bear.png"),
        fit: BoxFit.none,
        scale: 8.0,
      ),
    ),
    child: Image(width: 25.w, height: 25.h, image: AssetImage("assets/cow.png")),
  );
}

var imagesInfo = <String, String>{
  "Settings": "crocodile.png",
  "Payment details": "elephant.png",
  "Achievement": "horse.png",
  "Love": "cow.png",
  "Reminder": "buffalo.png",
};

Widget buildProfileListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        imagesInfo.length,
        (index) => GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.SETTINGPAGE),
          child: Container(
            margin: EdgeInsets.only(bottom: 10.h),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.primaryElement,
                  ),
                  child: Image.asset("assets/${imagesInfo.values.elementAt(index)}"),
                ),
                SizedBox(width: 15.w),
                Text(
                  imagesInfo.keys.elementAt(index),
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
