import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meme_generator_application/router/routes.dart';

import 'dashboard/dashboard_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        getPages: getPages,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: DashboardPage.TAG);
  }
}
