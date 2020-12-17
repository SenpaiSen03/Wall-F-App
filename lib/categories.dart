import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:wallpaper_f/data/data.dart';
import 'package:wallpaper_f/drawer/maindrawer.dart';
import 'dart:convert';
import 'package:wallpaper_f/models/categorie_model.dart';
import 'package:wallpaper_f/models/photos_model.dart';
import 'package:wallpaper_f/view/categorie_screen.dart';
import 'package:wallpaper_f/view/search_view.dart';
import 'package:wallpaper_f/widget/widget.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<CategorieModel> categories = new List();
  int noOfImageToLoad = 1000;
  List<PhotosModel> photos = new List();

  getTrendingWallpaper() async {
    await http.get(
        "https://api.pexels.com/v1/curated?per_page=$noOfImageToLoad&page=1",
        headers: {"Authorization": apiKEY}).then((value) {
      //print(value.body);

      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        //print(element);
        PhotosModel photosModel = new PhotosModel();
        photosModel = PhotosModel.fromMap(element);
        photos.add(photosModel);
        //print(photosModel.toString()+ "  "+ photosModel.src.portrait);
      });

      setState(() {});
    });
  }

  TextEditingController searchController = new TextEditingController();

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    //getWallpaper();
    getTrendingWallpaper();
    categories = getCategories();
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        noOfImageToLoad = noOfImageToLoad + 1000;
        getTrendingWallpaper();
      }
    });
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      drawer: MainDrawer(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 50),
                itemCount: categories.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  /// Create List Item tile
                  return CategoriesTile(
                    imgUrls: categories[index].imgUrl,
                    categorie: categories[index].categorieName,
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String imgUrls, categorie;

  CategoriesTile({@required this.imgUrls, @required this.categorie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategorieScreen(
                      categorie: categorie,
                    )));
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: kIsWeb
            ? Column(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: kIsWeb
                          ? Image.network(
                              imgUrls,
                              height: 100,
                              width: 300,
                              fit: BoxFit.cover,
                            )
                          : CachedNetworkImage(
                              imageUrl: imgUrls,
                              height: 100,
                              width: 300,
                              fit: BoxFit.cover,
                            )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Text(
                        categorie,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Overpass'),
                      )),
                ],
              )
            : Stack(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: kIsWeb
                          ? Image.network(
                              imgUrls,
                              height: 100,
                              width: 300,
                              fit: BoxFit.cover,
                            )
                          : CachedNetworkImage(
                              imageUrl: imgUrls,
                              height: 100,
                              width: 300,
                              fit: BoxFit.cover,
                            )),
                  Container(
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Container(
                      height: 100,
                      width: 300,
                      alignment: Alignment.center,
                      child: Text(
                        categorie ?? "Yo Yo",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Overpass'),
                      ))
                ],
              ),
      ),
    );
  }
}
