import 'package:get/get.dart';
import 'package:meme_generator_application/presentation/dashboard/dashboard_page.dart';
import 'package:meme_generator_application/presentation/random_version/random_version_page.dart';
import 'package:meme_generator_application/presentation/slide_version/slide_version_page.dart';

List<GetPage> getPages = [
  GetPage(name: DashboardPage.TAG, page: () => DashboardPage()),
  GetPage(name: SlideVersionPage.TAG, page: () => SlideVersionPage()),
  GetPage(name: RandomVersionPage.TAG, page: () => RandomVersionPage()),
];
