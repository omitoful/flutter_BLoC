import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/pages/register/bloc/register_event.dart';
import 'package:flutter_bloc_app/pages/register/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<UserNameEvent>((event, emit) {
      print("My user name is: ${event.userName}");
      emit(state.copyWith(userName: event.userName));
    });

    on<EmailEvent>((event, emit) {
      print("My email is: ${event.email}");
      emit(state.copyWith(email: event.email));
    });

    on<PasswordEvent>((event, emit) {
      print("My password is: ${event.password}");
      emit(state.copyWith(password: event.password));
    });

    on<RePasswordEvent>((event, emit) {
      print("My rePassword is: ${event.rePassword}");
      emit(state.copyWith(rePassword: event.rePassword));
    });
  }
}
