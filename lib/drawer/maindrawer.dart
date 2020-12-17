import 'package:flutter/material.dart';
import 'package:wallpaper_f/drawer/about.dart';
import 'package:wallpaper_f/drawer/contact.dart';
import 'package:wallpaper_f/drawer/rating.dart';

import '../home.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: 100,
            height: 50,
            margin: EdgeInsets.all(10.0),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new Home()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.rate_review),
            title: Text('Rate'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new Rating()));
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Contact Us'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new Contact()));
            },
          ),
          ListTile(
            leading: Icon(Icons.update),
            title: Text('Check for Updates'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Privacy Policy'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.account_circle_sharp),
            title: Text('About'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new About()));
            },
          ),
        ],
      ),
    );
  }
}
