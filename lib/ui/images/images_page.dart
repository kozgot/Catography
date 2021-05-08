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
    return Scaffold(
      appBar: AppBar(
        title: Text("Image List"),
      ),
      /*
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          childAspectRatio: 1 / 1,
        ),
        itemBuilder: (context, index) {
          var item = StockPhoto.fromId(index);
          return GridItemWidget(item: item);
        },
      ),
       */
      body: BlocProvider(
        create: (context) => injector<ImageListBloc>(),
        child: BlocListener<ImageListBloc, ImageListState>(
          listener: (context, state) {
            if (state is Error) {
              context.showSnackBar(
                content: Text("Failed to refresh articles!"),
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

class ImageListLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
