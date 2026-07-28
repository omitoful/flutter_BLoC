import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/pages/common_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildSettingAppBar() {
  return AppBar(title: reusableTitleText("Settings"));
}

Widget settingButton(BuildContext context, void Function()? onPressed) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Confirm logout"),
            content: const Text("Confirm logout"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cancel"),
              ),
              TextButton(onPressed: onPressed, child: const Text("Confirm")),
            ],
          );
        },
      );
    },
    child: Container(
      height: 100.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage("assets/sheep.png"),
        ),
      ),
    ),
  );
}
