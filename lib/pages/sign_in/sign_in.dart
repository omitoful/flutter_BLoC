import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                buildThirdPartyLogin(context),
                Center(child: reusableText("Or use your email account to login")),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("Email"),
                      SizedBox(height: 5.h),
                      buildTextField("Enter your email address", "user", "email"),
                      reusableText("Password"),
                      SizedBox(height: 5.h),
                      buildTextField("Enter your Password", "password", "password"),
                      forgotPassword(),
                    ],
                  ),
                ),
                buildButton("Log In", "login", () {}),
                SizedBox(height: 20.h),
                buildButton("Register", "register", () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
