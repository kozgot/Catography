import 'package:catography/domain/interactor/image_interactor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'image_details_event.dart';
import 'image_details_state.dart';


class ImageDetailsBloc extends Bloc<ImageDetailsEvent, ImageDetailsState> {
  final ImageInteractor _imageInteractor;

  ImageDetailsBloc(
      this._imageInteractor,
      ) : super(Loading());

  @override
  Stream<ImageDetailsState> mapEventToState(ImageDetailsEvent event) async* {
    if (event is LoadImageEvent) {
      yield* _mapLoadImageToState(event);
    }
  }

  Stream<ImageDetailsState> _mapLoadImageToState(LoadImageEvent event) async* {
    print("Fetching Image from API with id: ${event.id}");
    final catImage = await _imageInteractor.getImageById(event.id);

    if(catImage != null) {
      print("Image fetched, sending ContentReady state with Image");
      yield ContentReady(catImage: catImage);
    } else {
      print("Image with ID ${event.id} was not found!");
      yield Error();
    }
  }
}
