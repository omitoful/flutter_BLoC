import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/pages/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_app/pages/home/bloc/home_state.dart';
import 'package:flutter_bloc_app/pages/home/widgets/home_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildHomeAppBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: homePageText("Hello", color: AppColors.primaryThreeElementText),
                ),
                SliverToBoxAdapter(child: homePageText("Kevin Chen", top: 0)),
                SliverPadding(padding: EdgeInsets.only(top: 10.h)),
                SliverToBoxAdapter(child: homeSearchView()),
                SliverToBoxAdapter(child: homeSliderView(context, state)),
                SliverToBoxAdapter(child: homeMenuView()),
                SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 18.h),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 10,
                    ),
                    delegate: SliverChildBuilderDelegate(childCount: 4, (
                      BuildContext context,
                      int index,
                    ) {
                      return GestureDetector(onTap: () {}, child: homeCourseGrid());
                    }),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
