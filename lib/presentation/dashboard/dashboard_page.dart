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
              Text("Anak 2"),
              Text("Anak 3"),
            ],
          ),
        ),
      ),
    );
  }
}
