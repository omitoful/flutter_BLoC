import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/common/colors.dart';
import 'package:flutter_bloc_app/pages/profile/widgets/profile_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildProfileAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              profileIconAndEditButton(),
              SizedBox(height: 10.h),
              Text(
                "Kevin Chen",
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 25, right: 25),
                child: buildProfileListView(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
