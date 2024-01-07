import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/util/app_colors.dart';
import 'package:quran/modules/home_page_screen/presentation/cubit/home_page_cubit.dart';
import 'package:quran/modules/home_page_screen/presentation/screens/content_screen.dart';
import 'package:quran/modules/home_page_screen/presentation/screens/surah_page_screen.dart';

import '../../../../generated/assets.dart';
import '../cubit/home_page_states.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData th = Theme.of(context);
    return BlocProvider(
      create: (BuildContext context) {
        return HomePageCubit();
      },
      child: BlocConsumer<HomePageCubit, AppStates>(
        builder: (context, state) {
          HomePageCubit homePageCubit = HomePageCubit.get(context);
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  opacity: 0.4,
                  image: AssetImage(Assets.imagesLightBack),
                ),
              ),
              child: Column(
                children: [
                  Align(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 37.h, right: 15.w, left: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            height: 30.h,
                            minWidth: 5.w,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.sp)
                            ),
                            elevation: 10,
                            child: const Icon(Icons.search,size: 20),
                          ),
                          Text(
                            "المصحف",
                            style: th.textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (value) {
                        homePageCubit.changePageView(value);
                      },
                      controller: homePageCubit.navBarController,
                      children: [
                        const ContentScreen(),
                        const ContentScreen(),
                        const ContentScreen(),
                        const ContentScreen(),
                        const ContentScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar:BottomNavigationBar(
              onTap: (val){
                homePageCubit.changePageViewNaveBar(val);
              },
              unselectedItemColor: Colors.white,
              selectedFontSize: 20.sp,
              currentIndex: homePageCubit.pageNavNumber,
              backgroundColor: AppColors.kPrimaryColor,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              selectedIconTheme: IconThemeData(color: Colors.amber),
              useLegacyColorScheme: true,
              items: [
                BottomNavigationBarItem(icon: Image.asset(Assets.imagesQuranNavBar,width: 30.w,height: 30.h,color: homePageCubit.pageNavNumber == 0 ? Colors.amber :Colors.white),label: "المصحف"),
                BottomNavigationBarItem(icon: Image.asset(Assets.imagesIslam,width: 30.w,height: 30.h,color: homePageCubit.pageNavNumber == 1 ? Colors.amber :Colors.white),label: "الأحاديث"),
                BottomNavigationBarItem(icon: Image.asset(Assets.imagesStar,width: 30.w,height: 30.h,color: homePageCubit.pageNavNumber == 2 ? Colors.amber :Colors.white),label: "المفضلة"),
                BottomNavigationBarItem(icon: Image.asset(Assets.imagesQibla,width: 30.w,height: 30.h,color: homePageCubit.pageNavNumber == 3 ? Colors.amber :Colors.white),label: "القبلة"),
                BottomNavigationBarItem(icon: Image.asset(Assets.imagesSettings,width: 30.w,height: 30.h,color: homePageCubit.pageNavNumber == 4 ? Colors.amber :Colors.white),label: "الإعدادات"),
              ],
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
