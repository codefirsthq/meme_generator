import 'package:flutter/material.dart';

class SlideVersionPage extends StatefulWidget {
  static final String TAG = '/slide_version_page';
  @override
  _SlideVersionPageState createState() => _SlideVersionPageState();
}

class _SlideVersionPageState extends State<SlideVersionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Slide"),),
    );
  }
}
