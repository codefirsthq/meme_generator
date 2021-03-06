import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:meme_generator_application/presentation/random_version/random_version_page.dart';
import 'package:meme_generator_application/presentation/slide_version/slide_version_page.dart';

class DashboardPage extends StatefulWidget {
  static final String TAG = '/dashboard_page';
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        colorFilter: ColorFilter.linearToSrgbGamma(),
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/funny_dog.jpg'),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Meme Generator",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 50),
                      ),
                      Text("don't forget to laugh, release your emotions")
                    ],
                  ),
                ),
                BuildCardFeature(
                  assetImage: 'assets/images/meme1.jpg',
                  title: "VERSION\n#1",
                  onPressed: () {
                    Get.toNamed(SlideVersionPage.TAG);
                  },
                ),
                BuildCardFeature(
                  assetImage: 'assets/images/meme2.jpg',
                  title: "VERSION\n#2",
                  onPressed: () {
                    Get.toNamed(RandomVersionPage.TAG);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildCardFeature extends StatelessWidget {
  const BuildCardFeature(
      {Key key,
      @required this.assetImage,
      @required this.title,
      @required this.onPressed})
      : super(key: key);

  final String assetImage;
  final String title;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          width: double.infinity,
          height: 180,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[400],
                  blurRadius: 3,
                  spreadRadius: 3,
                  offset: Offset(5, 5))
            ],
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(assetImage),
              fit: BoxFit.fitWidth,
            ),
            color: Colors.white,
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white54),
            ),
          )),
    );
  }
}
