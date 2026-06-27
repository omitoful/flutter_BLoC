import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/pages/sign_in/bloc/sign_in_event.dart';
import 'package:flutter_bloc_app/pages/sign_in/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<EmailEvent>((event, emit) {
      print("My email is: ${event.email}");
      emit(state.copyWith(email: event.email));
    });

    on<PasswordEvent>((event, emit) {
      print("My password is: ${event.password}");
      emit(state.copyWith(password: event.password));
    });
  }
}
