import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/functions/navigate.dart';
import 'package:quran/core/routes/app_routes.dart';
import 'package:quran/modules/home_page_screen/presentation/cubit/home_page_cubit.dart';

import '../../../../generated/assets.dart';
import '../controls/sura_card.dart';
import '../cubit/home_page_states.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return HomePageCubit()..getSurahs();
      },
      child: BlocConsumer<HomePageCubit, AppStates>(
        builder: (context, state) {
          HomePageCubit homePageCubit = HomePageCubit.get(context);
          return ListView.builder(
            itemBuilder: (context, index) {
              return SurahItemCard(
                surah: homePageCubit.allSurah![index],
                onTapItemCard: () {
                  navigate(context: context, route: Routes.surahPageView);
                },
              );
            },
            itemCount: homePageCubit.allSurah?.length ?? 0,
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
