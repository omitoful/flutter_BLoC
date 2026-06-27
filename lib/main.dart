import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/pages/bloc_providers.dart';
import 'package:flutter_bloc_app/pages/register/register.dart';
import 'package:flutter_bloc_app/pages/sign_in/sign_in.dart';
import 'package:flutter_bloc_app/pages/welcome/welcome.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(elevation: 0, backgroundColor: Colors.white),
          ),
          home: Welcome(),
          routes: {
            // "myHomePage": (context) => MyHomePage(),
            "signIn": (context) => SignIn(),
            "register": (context) => Register(),
          },
        ),
      ),
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
