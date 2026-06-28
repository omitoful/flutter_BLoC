import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/common/routes/routes.dart';
import 'package:flutter_bloc_app/pages/application/application_page.dart';
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
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(elevation: 0, backgroundColor: Colors.white),
          ),
          onGenerateRoute: AppPages.GenerateRouteSettings,
          home: ApplicationPage(),
          // routes: {
          //   // "myHomePage": (context) => MyHomePage(),
          //   "signIn": (context) => SignIn(),
          //   "register": (context) => Register(),
          //   "application": (context) => ApplicationPage(),
          // },
        ),
      ),
    );
  }
}
