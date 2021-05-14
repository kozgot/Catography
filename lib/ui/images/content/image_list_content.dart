import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';
import '../image_list_bloc.dart';
import '../image_list_state.dart';

class ImageListContent extends StatefulWidget {
  final Content state;

  ImageListContent(this.state);

  @override
  _ImageListContentState createState() => _ImageListContentState(state);
}

class _ImageListContentState extends State<ImageListContent> {
  Content state;
  _ImageListContentState(this.state);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final queryData = MediaQuery.of(context);
    final imageCount = queryData.size.width < 900 ? 3 : queryData.size.width < 1300 ? 5 : 7;
    final imageExtent = queryData.size.width < 900 ? 125.0 : queryData.size.width < 1300 ? 175.0 : 225.0;

    return BlocListener<ImageListBloc, ImageListState>(
      listener: (_, state) {
      },
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: imageExtent,
            crossAxisCount: imageCount,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
            childAspectRatio: 1 / 1,
          ),
          itemCount: state.images.length,
          itemBuilder: (context, index) {
            final item = state.images[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  DETAIL_PAGE,
                  arguments: item,
                );
              },
              child: GridTile(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Hero(
                        tag: item.id,
                        child: CachedNetworkImage(
                          imageUrl: item.url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
    );
  }
}
