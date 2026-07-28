import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/common/constant.dart';
import 'package:flutter_bloc_app/common/global.dart';
import 'package:flutter_bloc_app/common/routes/names.dart';
import 'package:flutter_bloc_app/pages/application/bloc/app_bloc.dart';
import 'package:flutter_bloc_app/pages/application/bloc/app_event.dart';
import 'package:flutter_bloc_app/pages/profile/settings/bloc/setting_bloc.dart';
import 'package:flutter_bloc_app/pages/profile/settings/bloc/setting_state.dart';
import 'package:flutter_bloc_app/pages/profile/widgets/setting_widgets.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  void removeUserData() {
    context.read<AppBloc>().add(TriggerAppEvent(0));
    Global.storageService.remove(AppConstant.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SINGIN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSettingAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: BlocBuilder<SettingBloc, SettingState>(
          builder: (context, state) {
            return Container(
              child: Column(children: [settingButton(context, removeUserData)]),
            );
          },
        ),
      ),
    );
  }
}
