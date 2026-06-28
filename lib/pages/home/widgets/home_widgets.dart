import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/common/colors.dart';
import 'package:flutter_bloc_app/pages/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_app/pages/home/bloc/home_event.dart';
import 'package:flutter_bloc_app/pages/home/bloc/home_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildHomeAppBar() {
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

Widget homePageText(String text, {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget homeSearchView() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(color: AppColors.primaryFourElementText),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 20.w,
              height: 20.w,
              child: Image.asset("assets/pig.png"),
            ),
            Container(
              width: 240,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Search you course...",
                  contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
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
                obscureText: false,
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          padding: EdgeInsets.all(5.w),
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(Radius.circular(13.w)),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset("assets/sheep.png"),
        ),
      ),
    ],
  );
}

Widget homeSliderView(BuildContext context, HomeState state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomeBloc>().add(HomePageDots(value));
          },
          children: [
            _slidersContainer(path: "assets/horse.png"),
            _slidersContainer(path: "assets/sheep.png"),
            _slidersContainer(path: "assets/pig.png"),
            _slidersContainer(path: "assets/elephant.png"),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 4,
          position: state.index.toDouble(),
          decorator: DotsDecorator(
            color: AppColors.primaryThreeElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(17.0, 5.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ),
    ],
  );
}

Widget _slidersContainer({String path = "assets/horse.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.lightBlue,
      image: DecorationImage(image: AssetImage(path)),
    ),
  );
}

Widget homeMenuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _reusableSubTitleText("Choose your course"),
            GestureDetector(
              child: _reusableSubTitleText(
                "See all",
                color: AppColors.primaryThreeElementText,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 10.h),
        child: Row(
          children: [
            _reusableMenuText("All"),
            _reusableMenuText(
              "Popular",
              textColor: AppColors.primaryThreeElementText,
              bgColor: AppColors.primarySecondaryBackground,
            ),
            _reusableMenuText(
              "Newest",
              textColor: AppColors.primaryThreeElementText,
              bgColor: AppColors.primarySecondaryBackground,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _reusableMenuText(
  String text, {
  Color textColor = AppColors.primaryElementText,
  Color bgColor = AppColors.primaryElement,
}) {
  return Container(
    margin: EdgeInsets.only(right: 10.w),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(7.w),
      border: Border.all(color: bgColor),
    ),
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
    child: _reusableSubTitleText(
      text,
      color: textColor,
      fontWeight: FontWeight.normal,
      fontSize: 12,
    ),
  );
}

Widget _reusableSubTitleText(
  String text, {
  Color color = AppColors.primaryText,
  int fontSize = 16,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return Text(
    text,
    style: TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize.sp),
  );
}

Widget homeCourseGrid() {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(image: AssetImage("assets/crocodile.png")),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Best course for IT and Engineering",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryElementText,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Flutter course",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryFourElementText,
            fontSize: 10,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}
