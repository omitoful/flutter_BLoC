import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/pages/profile/settings/bloc/setting_event.dart';
import 'package:flutter_bloc_app/pages/profile/settings/bloc/setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState()) {
    on<TriggerSettingEvent>((event, emit) {
      emit(SettingState());
    });
  }
}
