import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter_bloc_app/pages/sign_in/bloc/sign_in_event.dart';
import 'package:flutter_bloc_app/pages/sign_in/bloc/sign_in_state.dart';
import 'package:flutter_bloc_app/pages/sign_in/sign_in_controller.dart';
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
    final controller = SignInController(context: context);

    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
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
                          buildTextField("Enter your email address", "user", "email", (
                            value,
                          ) {
                            context.read<SignInBloc>().add(EmailEvent(value));
                          }),
                          reusableText("Password"),
                          SizedBox(height: 5.h),
                          buildTextField("Enter your Password", "password", "password", (
                            value,
                          ) {
                            context.read<SignInBloc>().add(PasswordEvent(value));
                          }),
                          forgotPassword(),
                        ],
                      ),
                    ),
                    buildButton("Log In", "login", () {
                      controller.handleSignIn("login");
                    }),
                    SizedBox(height: 20.h),
                    buildButton("Register", "register", () {}),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
