import 'package:flutter/material.dart';
import 'package:wallpaper_f/widget/widget.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Created by Rahul Nath',
              style: TextStyle(
                  color: Colors.black54, fontSize: 16, fontFamily: 'Overpass'),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'B.Tech Computer Science Engineering',
              style: TextStyle(
                  color: Colors.black54, fontSize: 16, fontFamily: 'Overpass'),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Graphic Era University, Dehradun',
              style: TextStyle(
                  color: Colors.black54, fontSize: 16, fontFamily: 'Overpass'),
            ),
          ],
        ),
      ),
    );
  }
}
