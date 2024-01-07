import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/util/app_colors.dart';

import '../../../../generated/assets.dart';
import '../controls/card_item.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData th = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("القائمة",style: th.textTheme.titleLarge,),
      ),
      body: Center(
        child: GridView.count(crossAxisCount: 2,children: [
          ItemMenuCard(itemTitleName: "القرآن الكريم",imageName: Assets.imagesQuranIco,),
          ItemMenuCard(itemTitleName: "الاحاديث",imageName: Assets.imagesMosqe,),
          ItemMenuCard(itemTitleName: "الادعية",imageName: Assets.imagesQuranIco,),
          ItemMenuCard(itemTitleName: "التسابيح",imageName: Assets.imagesTasbehIco,),
          ItemMenuCard(itemTitleName: "القرآن الكريم",imageName: Assets.imagesQuranIco,),
        ]),
      ),
    );
  }
}
