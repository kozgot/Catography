import 'package:catography/domain/interactor/image_interactor.dart';
import 'package:catography/domain/model/cat_image.dart';
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
    } else if (event is ToggleImageOrderEvent) {
      yield* _mapToggleImageOrderEvent();
    }
  }

  Stream<ImageListState> _mapLoadImagesToState() async* {
    print("Getting Images from API");
    final images = await _imageInteractor.getCatImages();

    print("Images refreshed, sending Content state with Image list");
    yield ContentReady(images: images, descendingOrder: true);
  }

  Stream<ImageListState> _mapToggleImageOrderEvent() async* {
    final currentState = state;
    bool cucc = false;
    List<CatImage> cats = [];
    if (currentState is Content) {
      print("Toggle image order requested");
      final newDescending = !currentState.descendingOrder;
      final newImages = currentState.images;
      newImages.sort((a,b) { return newDescending ? a.compareTo(b) : b.compareTo(a); });
      cucc = !currentState.descendingOrder;
      cats = newImages;
      yield OrderChanged(images: cats, descendingOrder: !currentState.descendingOrder);
    }

    yield ContentReady(images: cats, descendingOrder: cucc);
  }
}
