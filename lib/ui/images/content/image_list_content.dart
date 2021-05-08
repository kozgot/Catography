import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:catography/ui/images/image_list_event.dart';
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
  late Completer _refreshCompleter;

  _ImageListContentState(this.state);

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ImageListBloc, ImageListState>(
      listener: (_, state) {
        if (!(state is Refreshing)) {
          _refreshCompleter.complete();
          _refreshCompleter = Completer();
        }
      },
      child: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<ImageListBloc>(context).add(LoadImagesEvent());
          return _refreshCompleter.future;
        },
        child: ListView.builder(
          itemCount: state.images.length,
          itemBuilder: (context, index) {
            final item = state.images[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  DETAIL_PAGE,
                  arguments: item.id,
                );
              },
              child: ListTile(
                leading: CachedNetworkImage(
                  imageUrl: item.url,
                  height: 40,
                  width: 40,
                ),
                title: Text(
                  item.id,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            item.breed != null ? item.breed!.name : "No Breed",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            item.createdAt.toString(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chevron_right,
                      size: 20,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
