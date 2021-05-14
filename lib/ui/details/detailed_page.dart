import 'package:cached_network_image/cached_network_image.dart';
import 'package:catography/domain/model/cat_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageDetails extends StatelessWidget {
  final CatImage catImage;

  ImageDetails(this.catImage);

  @override
  Widget build(BuildContext context) {
    final queryData = MediaQuery.of(context);
    final imageWidth = queryData.size.width > queryData.size.height ? queryData.size.height * 0.8 * 1.5 :queryData.size.width;
    final imageHeight = queryData.size.width > queryData.size.height ? queryData.size.height * 0.8 : imageWidth*0.75;

    return Scaffold(
          appBar: AppBar(
            title: Text("Image details"),
          ),
          body:SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [ CachedNetworkImage(
                  imageUrl: catImage.url,
                  width: imageWidth,
                  height: imageHeight,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(catImage.id),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(catImage.breed != null ? catImage.breed!.name : "No breed"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          catImage.createdAt.toString(),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final url = catImage.url;
                    await launch(url, forceWebView: true);
                  },
                  child: Text(
                    "OPEN IN BROWSER",
                  ),
                ),
              ],
            ),
        ),
    );
  }
}
