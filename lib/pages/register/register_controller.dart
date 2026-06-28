import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/common/toast.dart';
import 'package:flutter_bloc_app/pages/register/bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;
  RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "Please enter your full name");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Please enter your email");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Please enter your password");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Please enter your password again");
      return;
    }
    if (password != rePassword) {
      toastInfo(msg: "Password does not match");
      return;
    }

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(msg: "An email has been sent to your email address.");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        toastInfo(msg: "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "The email is already in use");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "Your email id is invalid");
      }
    }
  }
}
