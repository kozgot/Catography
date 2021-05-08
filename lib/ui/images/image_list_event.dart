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

class RefreshImagesEvent extends ImageListEvent {
  static final RefreshImagesEvent _instance = RefreshImagesEvent._();

  factory RefreshImagesEvent() => _instance;

  RefreshImagesEvent._();
}
