import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/modules/home_page_screen/data/model/surah.dart';
import '../../../../generated/assets.dart';

class SurahItemCard extends StatelessWidget {
  SurahItemCard({
    super.key,
    required this.surah,
    this.onTapItemCard,
  });

  Surah surah;
  GestureTapCallback? onTapItemCard;

  @override
  Widget build(BuildContext context) {
    ThemeData th = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(4.sp),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Ink(
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.sp,
            ),
          ),
          child: InkWell(
            onTap: onTapItemCard,
            borderRadius: BorderRadius.circular(10.sp),
            child: Padding(
              padding: EdgeInsets.all(4.sp),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "الصفحة ${surah.surahPage}",
                      style: th.textTheme.titleSmall,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "رقم السورة ${surah!.number}",
                      style: th.textTheme.titleSmall,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        surah!.surahName!,
                        style: th.textTheme.titleLarge,
                      ),
                      Expanded(
                          child: Text(
                        "عدد الايات ${surah!.numberOfAyahs}",
                        style: th.textTheme.titleMedium,
                      )),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            splashRadius: 15.sp,
                            icon: Icon(
                              Icons.favorite_border,
                              size: 23.sp,
                            ),
                          ),
                          Image(
                            image: surah.revelationType == "Meccan"
                                ? AssetImage(Assets.imagesKaba)
                                : AssetImage(Assets.imagesMosqe),
                            width: 30.w,
                            height: 30.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
