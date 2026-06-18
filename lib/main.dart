import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/pages/welcome/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBlocs(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Welcome()),
    );
  }
}

class AppBlocs extends Bloc<AppEvents, AppStates> {
  AppBlocs() : super(const AppInitialState()) {}
}

@immutable
abstract class AppStates {
  const AppStates();
}

class AppInitialState extends AppStates {
  const AppInitialState();
}

@immutable
abstract class AppEvents {
  const AppEvents();
}
