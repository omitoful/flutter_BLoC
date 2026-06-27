import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/common/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(color: AppColors.primarySecondaryBackground, height: 1.0),
    ),
    title: Text(
      "Log In",
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcon("assets/buffalo.png", () {}),
        _reusableIcon("assets/horse.png", () {}),
        _reusableIcon("assets/sheep.png", () {}),
      ],
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withValues(alpha: 0.5),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
    ),
  );
}

Widget buildTextField(
  String hintText,
  String icon,
  String textType,
  void Function(String)? onChanged,
) {
  return Container(
    margin: EdgeInsets.only(bottom: 10.h),
    child: Container(
      margin: EdgeInsets.only(bottom: 20.w),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: AppColors.primaryFourElementText),
      ),
      child: Row(
        children: [
          Container(
            width: 16.w,
            margin: EdgeInsets.only(left: 17.w),
            height: 16.w,
            child: Image.asset("assets/$icon.png"),
          ),
          SizedBox(
            width: 270.w,
            height: 50.h,
            child: TextField(
              onChanged: onChanged,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintStyle: TextStyle(color: AppColors.primarySecondaryElementText),
              ),
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenic",
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,
              ),
              autocorrect: false,
              obscureText: textType == "password" ? true : false,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget forgotPassword() {
  return Container(
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot Password?",
        style: TextStyle(
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
          fontSize: 12.sp,
        ),
      ),
    ),
  );
}

Widget buildButton(String text, String type, VoidCallback? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      decoration: BoxDecoration(
        color: type == "login" ? AppColors.primaryElement : AppColors.primaryBackground,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(
          color: type == "login" ? Colors.transparent : AppColors.primaryFourElementText,
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
            color: Colors.grey.withValues(alpha: 0.1),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: type == "login" ? AppColors.primaryBackground : AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ),
  );
}

Widget _reusableIcon(String icon, VoidCallback? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(width: 40.w, height: 40.w, child: Image.asset(icon)),
  );
}
