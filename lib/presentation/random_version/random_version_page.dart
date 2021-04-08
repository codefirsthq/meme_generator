import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:meme_generator_application/domain/meme/meme_data_model.dart';
import 'package:meme_generator_application/infrastructure/meme/meme_repository.dart';
import 'package:meme_generator_application/presentation/photo_view/photo_view_page.dart';

class RandomVersionPage extends StatefulWidget {
  static final String TAG = '/random_version_page';
  @override
  _RandomVersionPageState createState() => _RandomVersionPageState();
}

class _RandomVersionPageState extends State<RandomVersionPage> {
  Random rnd = Random();
  MemeRepository memeRepository = MemeRepository();

  Future _future;



  
  @override
  void initState() {
    _future = memeRepository.getComicAt(rnd.nextInt(2445) + 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Random Page")),
      body: SafeArea(
        child: Container(
          child: FutureBuilder<MemeDataModel>(
            future: _future,
            builder: (context, snp) {
              switch (snp.connectionState) {
                case ConnectionState.waiting:
                  return loadingPage();
                  break;
                case ConnectionState.done:
                  if (snp.hasData) {
                    var data = snp.data;
                    return doneContainer(data);
                  } else {
                    return errorPage();
                  }
                  break;
                default:
                  return nonePage();
                  break;
              }
            },
          ),
        ),
      ),
    );
  }

  Container doneContainer(MemeDataModel data) {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          Get.toNamed(PhotoViewPage.TAG, arguments: data.img);
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Text(
                      data.title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                      child: Image.network(
                    data.img,
                    loadingBuilder: (context, _, loading) {
                      if (loading == null) return _;
                      return CircularProgressIndicator(
                          value: loading.expectedTotalBytes != null
                              ? loading.cumulativeBytesLoaded /
                                  loading.expectedTotalBytes
                              : null);
                    },
                  )),
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.green,
                  label: Text(
                    "Random Comic",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      _future =
                          memeRepository.getComicAt(rnd.nextInt(2445) + 1);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget loadingPage() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget errorPage() {
  return Center(child: Text("Something wrong"));
}

Widget nonePage() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/no_data.png'),
        TextButton(onPressed: () {}, child: Text("Refresh"))
      ],
    ),
  );
}
