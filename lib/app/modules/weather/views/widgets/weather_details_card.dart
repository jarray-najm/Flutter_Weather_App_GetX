import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../../../utils/extensions.dart';
import '../../../../../config/translations/strings_enum.dart';
import '../../../../components/custom_cached_image.dart';
import '../../../../data/models/weather_details_model.dart';

class WeatherDetailsCard extends StatelessWidget {
  final WeatherDetailsModel weatherDetails;
  final Forecastday forecastDay;
  const WeatherDetailsCard({
    super.key,
    required this.weatherDetails,
    required this.forecastDay,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 10.h),
      margin: EdgeInsets.symmetric(horizontal: 1.w),
      decoration: BoxDecoration(
        // color:   color: Color(0xFF348316),,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            // margin: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    AutoSizeText(
                      '${weatherDetails.location.region.toRightCity()} ${weatherDetails.location.country.toRightCountry()}',
                      style: theme.textTheme.displayMedium?.copyWith(),
                      maxLines: 2,
                    ),
                    // AutoSizeText(
                    //   '${weatherDetails.location.country.toRightCountry()}',
                    //   style: theme.textTheme.displayMedium?.copyWith(),
                    // ),
                    8.verticalSpace,
                    AutoSizeText(
                      '${forecastDay.date.year}-${forecastDay.date.month}-${forecastDay.date.day}',
                      style:
                          theme.textTheme.displayMedium?.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
          8.verticalSpace,
          Container(
            padding: EdgeInsets.all(5),
            // margin: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.r),
                )),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    CustomCachedImage(
                      imageUrl: forecastDay.day.condition.icon
                          .toHighRes()
                          .addHttpPrefix(),
                      fit: BoxFit.cover,
                      width: 100.w,
                      height: 100.h,
                    ),
                    16.verticalSpace,
                    Text(
                      forecastDay.day.condition.text,
                      style: theme.textTheme.displaySmall
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    16.verticalSpace,
                  ],
                ),
                Column(
                  children: [
                    Text(
                      ' ${weatherDetails.location.name.toRightCity()}',
                      style: theme.textTheme.displaySmall?.copyWith(),
                    ),
                    8.verticalSpace,
                    Text(
                      '${forecastDay.day.avgtempC.toInt()}${Strings.celsius.tr}',
                      style: theme.textTheme.displayMedium?.copyWith(
                        fontSize: 50.sp,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(
                            '${forecastDay.day.mintempC.toInt()}${Strings.celsius.tr}',
                            style: theme.textTheme.displaySmall?.copyWith(),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(
                            '${forecastDay.day.maxtempC.toInt()}${Strings.celsius.tr}',
                            style: theme.textTheme.displaySmall?.copyWith(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          8.verticalSpace,
          Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.r),
                )),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //!
                    Container(
                      decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.r),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            8.verticalSpace,
                            Text(
                              Strings.chanceOfRain.tr,
                              style: theme.textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            8.verticalSpace,
                            8.verticalSpace,
                            Text(
                              '${forecastDay.day.dailyChanceOfRain}%',
                              style: theme.textTheme.displaySmall?.copyWith(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //!
                    Container(
                      decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.r),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            8.verticalSpace,
                            Text(
                              Strings.humidity.tr,
                              style: theme.textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            8.verticalSpace,
                            8.verticalSpace,
                            Text(
                              '${forecastDay.day.avghumidity}%',
                              style: theme.textTheme.displaySmall?.copyWith(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //!

                    //!
                    Container(
                      decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.r),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            8.verticalSpace,
                            Text(
                              Strings.totalpercip.tr,
                              style: theme.textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            8.verticalSpace,
                            8.verticalSpace,
                            Text(
                              '${forecastDay.day.totalprecipMm}Mm',
                              style: theme.textTheme.displaySmall?.copyWith(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                8.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
