import 'package:chance_button/core/constant/app_constants.dart';
import 'package:chance_button/view/home/view/hot_cold_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EasyLocalization(
      supportedLocales: [AppConstants.EN_LOCALE,AppConstants.TR_LOCALE],
      path: AppConstants.LANG_PATH,
      child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HotColdView(),
    );
  }
}
