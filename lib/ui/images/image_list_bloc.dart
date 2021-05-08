import 'package:catography/domain/interactor/image_interactor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'image_list_event.dart';
import 'image_list_state.dart';

class ImageListBloc extends Bloc<ImageListEvent, ImageListState> {
  final ImageInteractor _imageInteractor;

  ImageListBloc(
      this._imageInteractor,
      ) : super(Loading());

  @override
  Stream<ImageListState> mapEventToState(ImageListEvent event) async* {
    if (event is LoadImagesEvent) {
      yield* _mapLoadImagesToState();
    } else if (event is RefreshImagesEvent) {
      yield* _mapRefreshImagesEvent();
    }
  }

  Stream<ImageListState> _mapLoadImagesToState() async* {
    print("Getting Images from API");
    final images = await _imageInteractor.getCatImages();

    print("Images refreshed, sending Content state with Image list");
    yield ContentReady(images: images);
  }

  Stream<ImageListState> _mapRefreshImagesEvent() async* {
    final currentState = state;
    if (!(currentState is Refreshing)) {
      if (currentState is Content) {
        print("Image refreshing requested");
        yield Refreshing(images: currentState.images);
      }
    }

    print("Getting Images from API");
    final images = await _imageInteractor.getCatImages();

    yield ContentReady(images: images);
  }
}
