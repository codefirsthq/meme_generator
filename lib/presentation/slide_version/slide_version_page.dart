import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meme_generator_application/domain/meme/meme_data_model.dart';

class SlideVersionPage extends StatefulWidget {
  static final String TAG = '/slide_version_page';
  @override
  _SlideVersionPageState createState() => _SlideVersionPageState();
}

class _SlideVersionPageState extends State<SlideVersionPage> {
  Future<MemeDataModel> getComicAt(int page) async {
    Response response;
    Dio dio = Dio();

    try {
      response = await dio.get("https://xkcd.com/${page}/info.0.json");
      var _data = MemeDataModel.fromJson(response.data);
      return _data;
    } catch (e) {}
  }

  Random rnd = Random();

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
              future: getComicAt(rnd.nextInt(2445) + 1),
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

  Center doneState(MemeDataModel dataModel) {
    return Center(
        child: Text(
      dataModel.img,
      style: TextStyle(fontSize: 40),
    ));
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
