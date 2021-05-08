import 'package:flutter/foundation.dart';

@immutable
abstract class ImageListEvent {
  const ImageListEvent();
}

class LoadImagesEvent extends ImageListEvent {
  static final LoadImagesEvent _instance = LoadImagesEvent._();

  factory LoadImagesEvent() => _instance;

  LoadImagesEvent._();
}
