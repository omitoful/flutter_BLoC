import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;
  SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
        String email = state.email;
        String password = state.password;
        if (email.isEmpty) {
          //
        }
        if (password.isEmpty) {
          //
        }

        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          var user = credential.user;
          if (user == null) {
          } else if (!user.emailVerified) {
          } else {}
        } catch (e) {}
      }
    } catch (e) {}
  }
}
