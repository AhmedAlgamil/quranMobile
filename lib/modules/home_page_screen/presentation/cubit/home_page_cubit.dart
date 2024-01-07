import 'package:flutter/material.dart';
import 'package:quran/modules/home_page_screen/data/model/Ayah.dart';
import 'package:quran/modules/home_page_screen/data/model/surah.dart';

import '../../../../generated/assets.dart';

import 'home_page_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class HomePageCubit extends Cubit<AppStates> {
  HomePageCubit() : super(AppInitialState());

  static HomePageCubit get(BuildContext context) => BlocProvider.of(context);

  List<Surah>? allSurah;

  List<Ayah>? allAyah;

  List<Ayah>? allAyahPage = [];

  PageController controller = PageController(initialPage: 0);
  PageController navBarController = PageController(initialPage: 0);
  int pageNavNumber = 0;

  void changePageView(int index) {
    controller.animateToPage(index,
        duration: const Duration(seconds: 1), curve: Curves.fastEaseInToSlowEaseOut);
    getAyahsPage(index);
    emit(PageViewChangeState());
  }

  void changePageViewNaveBar(int index) {
    navBarController.animateToPage(index,
        duration: const Duration(seconds: 1), curve: Curves.fastEaseInToSlowEaseOut);
    pageNavNumber = index;
    emit(PageViewChangeState());
  }

  void getSurahs() async {
    // Load the JSON file
    String jsonString = await rootBundle.loadString(Assets.jsonSurah);

    // Decode the JSON data to a List<dynamic>
    final jsonResponse = json.decode(jsonString);

    // Map the dynamic List to List<User>
    allSurah = (jsonResponse as List).map((i) => Surah.fromJson(i)).toList();

    emit(SurahLoadStates());
  }

  void getAyahsPage(int pageIndex) async {
    // if (allAyahPage != null) allAyahPage!.clear();
    for (int i = 0; i < allAyah!.length; i++) {
      if (pageIndex == int.parse(allAyah![i].page!)) {
        allAyahPage!.add(allAyah![i]);
        print("${allAyahPage![i].textAyah} ${allAyahPage![i].number} ");
      }
    }
    // Map the dynamic List to List<User>
    emit(LoadPageAyahsState());
  }

  void getAyahs() async {
    // Load the JSON file
    String jsonString = await rootBundle.loadString(Assets.jsonAyah);

    // Decode the JSON data to a List<dynamic>
    final jsonResponse = json.decode(jsonString);

    // Map the dynamic List to List<User>
    allAyah = (jsonResponse as List).map((i) => Ayah.fromJson(i)).toList();
    emit(LoadAllAyahsState());
  }
}
