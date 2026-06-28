import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/common/toast.dart';
import 'package:flutter_bloc_app/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;
  SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'login') {
        final state = context.read<SignInBloc>().state;
        String email = state.email;
        String password = state.password;

        if (email.isEmpty) {
          toastInfo(msg: "Email 不能為空");
          return;
        }
        final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        ).hasMatch(email);
        if (!emailValid) {
          toastInfo(msg: "Email 格式不正確");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "密碼不能為空");
          return;
        }
        if (password.length < 6) {
          toastInfo(msg: "密碼長度不能小於 6 位");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          var user = credential.user;
          if (user == null) {
            toastInfo(msg: "您不屬於此app的使用者");
            return;
          } else if (!user.emailVerified) {
            toastInfo(msg: "尚未驗證");
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil("/application", (route) => false);
          } else {
            toastInfo(msg: "登入成功！");
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil("/application", (route) => false);
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'invalid-credential') {
            toastInfo(msg: "帳號或密碼錯誤，或者該使用者尚未註冊。");
            return;
          } else {
            toastInfo(msg: "發生其他 Firebase 錯誤: ${e.message}");
            return;
          }
        }
      }
    } catch (e) {
      toastInfo(msg: "登入發生錯誤: $e");
    }
  }
}
