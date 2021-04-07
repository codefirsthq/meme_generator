import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              ),
              BuildCardFeature(
                assetImage: 'assets/images/meme2.jpg',
                title: "VERSION\n#2",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildCardFeature extends StatelessWidget {
  const BuildCardFeature({
    Key key,
    @required this.assetImage,
    @required this.title,
  }) : super(key: key);

  final String assetImage;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        ));
  }
}
