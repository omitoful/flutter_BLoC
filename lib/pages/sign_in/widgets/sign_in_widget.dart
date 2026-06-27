import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/common/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

Widget _reusableIcon(String icon, VoidCallback? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(width: 40.w, height: 40.w, child: Image.asset(icon)),
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
