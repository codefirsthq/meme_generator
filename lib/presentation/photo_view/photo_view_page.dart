import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewPage extends StatelessWidget {
  static final String TAG = '/photo_view_page';

  final String url = Get.arguments as String;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: PhotoView(
      imageProvider: NetworkImage(url),
    ));
  }
}
