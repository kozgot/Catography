import 'package:catography/di/di_utils.dart';
import 'package:catography/ui/images/image_list_bloc.dart';
import 'package:catography/ui/images/image_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'content/image_list_content.dart';
import 'image_list_event.dart';
import 'package:catography/utils.dart';


class ImageListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ImageListPageState();
}

class ImageListLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ImageListPageState extends State<ImageListPage> {
  bool descendingOrder = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image List"),
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  descendingOrder = !descendingOrder;
                });
              },
              child: descendingOrder? Text('Order by dates descending'):Text('Order by dates ascending'),
            style: TextButton.styleFrom(
              primary: Colors.white,
              textStyle: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => injector<ImageListBloc>(),
        child: BlocListener<ImageListBloc, ImageListState>(
          listener: (context, state) {
            if (state is Error) {
              context.showSnackBar(
                content: Text("Failed to refresh images!"),
              );
            }
          },
          child: BlocBuilder<ImageListBloc, ImageListState>(
            builder: (context, state) {
              if (state is Loading) {
                BlocProvider.of<ImageListBloc>(context)
                    .add(LoadImagesEvent());
                return ImageListLoading();
              }

              if (state is Content) {
                if (descendingOrder) {
                  state.images.sort((a, b) { return a.compareTo(b); });
                } else {
                  state.images.sort((a, b) { return b.compareTo(a); });
                }

                return ImageListContent(state);
              }

              return Center(
                child: Text("Something went wrong :("),
              );
            },
          ),
        ),
      ),
    );
  }
}
