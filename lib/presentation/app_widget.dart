import 'package:flutter/material.dart';
import 'package:meme_generator_application/presentation/dashboard/dashboard_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DashboardPage());
  }
}
