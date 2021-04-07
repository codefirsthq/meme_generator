import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meme_generator_application/presentation/dashboard/dashboard_page.dart';
import 'package:meme_generator_application/presentation/slide_version/slide_version_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        getPages: [
          GetPage(name: DashboardPage.TAG, page: () => DashboardPage()),
          GetPage(name: SlideVersionPage.TAG, page: () => SlideVersionPage()),
        ],
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DashboardPage());
  }
}
