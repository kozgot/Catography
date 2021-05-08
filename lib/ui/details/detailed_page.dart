import 'package:cached_network_image/cached_network_image.dart';
import 'package:catography/di/di_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'image_details_bloc.dart';
import 'image_details_event.dart';
import 'image_details_state.dart';


class ImageDetails extends StatelessWidget {
  final String imageId;

  ImageDetails(this.imageId);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<ImageDetailsBloc>(),
      child: BlocBuilder<ImageDetailsBloc, ImageDetailsState>(
        builder: (context, state) {
          if (state is Loading) {
            BlocProvider.of<ImageDetailsBloc>(context)
                .add(LoadImageEvent(imageId));
            return ImageDetailsLoading();
          }

          if (state is ContentReady) {
            final image = state.catImage;
            return Scaffold(
              appBar: AppBar(
                title: Text("Image details"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [ CachedNetworkImage(
                      imageUrl: image.url,
                      height: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(image.id),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(image.breed != null ? image.breed!.name : "No breed"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(
                              image.createdAt.toString(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final url = image.url;
                        await launch(url, forceWebView: true);
                        // This should be working, but it doesn't.
                        // if (await canLaunch(url)) {
                        //   await launch(url);
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //       content: Text("Could not launch ${article.url}"),
                        //     ),
                        //   );
                        // }
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

          return Center(
            child: Text(
              "Something went wrong while retrieving Article with id $imageId",
            ),
          );
        },
      ),
    );
  }
}

class ImageDetailsLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image details"),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
