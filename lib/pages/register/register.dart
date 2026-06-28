import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/pages/common_widgets.dart';
import 'package:flutter_bloc_app/pages/register/bloc/register_bloc.dart';
import 'package:flutter_bloc_app/pages/register/bloc/register_event.dart';
import 'package:flutter_bloc_app/pages/register/bloc/register_state.dart';
import 'package:flutter_bloc_app/pages/register/register_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Register"),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20.h),
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("User Name"),
                          buildTextField("Enter your full name.", "user", "user", (
                            value,
                          ) {
                            context.read<RegisterBloc>().add(UserNameEvent(value));
                          }),
                          reusableText("Email"),
                          buildTextField("Enter your email address.", "user", "email", (
                            value,
                          ) {
                            context.read<RegisterBloc>().add(EmailEvent(value));
                          }),
                          reusableText("Password"),
                          buildTextField("Enter your password.", "password", "password", (
                            value,
                          ) {
                            context.read<RegisterBloc>().add(PasswordEvent(value));
                          }),
                          reusableText("Confirm Password"),
                          buildTextField(
                            "Enter your password again.",
                            "password",
                            "password",
                            (value) {
                              context.read<RegisterBloc>().add(RePasswordEvent(value));
                            },
                          ),
                          reusableText("Enter your details below and free sign up!"),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.sp),
                    buildButton("Sign Up", "signUp", () {
                      RegisterController(context: context).handleEmailRegister();
                    }),
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
