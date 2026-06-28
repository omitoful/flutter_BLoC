import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/common/colors.dart';
import 'package:flutter_bloc_app/pages/application/bloc/app_bloc.dart';
import 'package:flutter_bloc_app/pages/application/bloc/app_event.dart';
import 'package:flutter_bloc_app/pages/application/bloc/app_state.dart';
import 'package:flutter_bloc_app/pages/application/widgets/application_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              body: buildPage(state.index),
              bottomNavigationBar: Container(
                width: 375.w,
                height: 58.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.h),
                    topRight: Radius.circular(20.h),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  onTap: (index) {
                    context.read<AppBloc>().add(TriggerAppEvent(index));
                  },
                  currentIndex: state.index,
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryFourElementText,
                  backgroundColor: Colors.white,
                  items: bottomTabs,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
