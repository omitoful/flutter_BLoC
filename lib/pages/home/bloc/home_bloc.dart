import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/pages/home/bloc/home_event.dart';
import 'package:flutter_bloc_app/pages/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomePageDots>((event, emit) {
      emit(state.copyWith(index: event.index));
    });
  }
}
