import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:meme_generator_application/domain/meme/meme_data_model.dart';
import 'package:meme_generator_application/infrastructure/meme/meme_repository.dart';
import 'package:meme_generator_application/presentation/photo_view/photo_view_page.dart';

class SlideVersionPage extends StatefulWidget {
  static final String TAG = '/slide_version_page';
  @override
  _SlideVersionPageState createState() => _SlideVersionPageState();
}

class _SlideVersionPageState extends State<SlideVersionPage> {
  Random rnd = Random();
  MemeRepository memeRepository = MemeRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slide"),
      ),
      body: Container(
        child: PageView.builder(
          itemBuilder: (context, index) {
            return FutureBuilder<MemeDataModel>(
              future: memeRepository.getComicAt(rnd.nextInt(2445) + 1),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return loadingState();
                    break;
                  case ConnectionState.done:
                    return (snapshot.hasError)
                        ? errorState(snapshot.error.toString())
                        : doneState(snapshot.data);
                    break;
                  default:
                    return defaultState();
                    break;
                }
              },
            );
          },
        ),
      ),
    );
  }

  Widget doneState(MemeDataModel data) {
    return SingleChildScrollView(
      child: InkWell(
        onTap: () {
          print(data.img);
          Get.toNamed(PhotoViewPage.TAG, arguments: data.img);
        },
        child: Container(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  data.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Image.network(
                data.img,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  data.alt,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Center defaultState() {
    return Center(
      child: Text("DEFAULT"),
    );
  }

  Center errorState(String error) {
    return Center(
      child: Text(error),
    );
  }

  Center loadingState() => Center(child: CircularProgressIndicator());
}
