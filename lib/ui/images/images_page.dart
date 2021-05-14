import 'package:catography/di/di_utils.dart';
import 'package:catography/ui/images/image_list_bloc.dart';
import 'package:catography/ui/images/image_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'content/image_list_content.dart';
import 'image_list_event.dart';
import 'package:catography/utils.dart';


class ImageListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
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
                return Scaffold(
                    appBar: AppBar(
                      title: Text("Image List"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            BlocProvider.of<ImageListBloc>(context)
                                .add(LoadImagesEvent());
                          },
                          child: Text('Order by dates descending'),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            textStyle: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    body: ImageListLoading()
                );
              }

                return Scaffold(
                    appBar: AppBar(
                      title: Text("Image List"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            BlocProvider.of<ImageListBloc>(context)
                                .add(ToggleImageOrderEvent());
                          },
                          child: state is Content && state.descendingOrder ? Text('Order by dates descending') : Text('Order by dates ascending'),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            textStyle: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    body: state is Content ? ImageListContent(state) : Center(child: Text("Something went wrong :(")),
                );
            },
          ),
        ),
    );
  }
}

class ImageListLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
