import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/common/global.dart';
import 'package:flutter_bloc_app/common/routes/names.dart';
import 'package:flutter_bloc_app/pages/application/application_page.dart';
import 'package:flutter_bloc_app/pages/application/bloc/app_bloc.dart';
import 'package:flutter_bloc_app/pages/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_app/pages/home/home_page.dart';
import 'package:flutter_bloc_app/pages/profile/settings/bloc/setting_bloc.dart';
import 'package:flutter_bloc_app/pages/profile/settings/setting_page.dart';
import 'package:flutter_bloc_app/pages/register/bloc/register_bloc.dart';
import 'package:flutter_bloc_app/pages/register/register.dart';
import 'package:flutter_bloc_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter_bloc_app/pages/sign_in/sign_in.dart';
import 'package:flutter_bloc_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:flutter_bloc_app/pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.SINGIN,
        page: SignIn(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: Register(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBloc()),
      ),
      PageEntity(
        route: AppRoutes.HOMEPAGE,
        page: HomePage(),
        bloc: BlocProvider(create: (_) => HomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.SETTINGPAGE,
        page: SettingPage(),
        bloc: BlocProvider(create: (_) => SettingBloc()),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var item in routes()) {
      if (item.bloc != null) {
        blocProviders.add(item.bloc);
      }
    }
    return blocProviders;
  }

  // a modal that covers entire screen as we click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          if (Global.storageService.getIsLoggedIn()) {
            return MaterialPageRoute(
              builder: (_) => const ApplicationPage(),
              settings: settings,
            );
          }
          return MaterialPageRoute(builder: (_) => const SignIn(), settings: settings);
        }
        print("valid route name: ${settings.name}");
        return MaterialPageRoute(builder: (_) => result.first.page, settings: settings);
      }
    }
    print("invalid route name: ${settings.name}");
    return MaterialPageRoute(builder: (_) => SignIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}
