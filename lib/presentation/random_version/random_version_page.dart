import 'package:flutter/material.dart';

class RandomVersionPage extends StatefulWidget {
  static final String TAG = '/random_version_page';
  @override
  _RandomVersionPageState createState() => _RandomVersionPageState();
}

class _RandomVersionPageState extends State<RandomVersionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Random Page")),
    );
  }
}
