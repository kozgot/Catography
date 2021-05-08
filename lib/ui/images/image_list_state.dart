import 'package:catography/domain/model/cat_image.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ImageListState {
  const ImageListState();
}

class Loading extends ImageListState {
  static final Loading _instance = Loading._();

  factory Loading() => _instance;

  Loading._();
}

abstract class Content extends ImageListState {
  final List<CatImage> images;

  Content({required this.images});
}

class ContentReady extends Content with EquatableMixin {
  ContentReady({required List<CatImage> images}): super(images: images);

  @override
  List<Object> get props => [images];
}

class Refreshing extends Content with EquatableMixin {
  Refreshing({required List<CatImage> images}): super(images: images);

  @override
  List<Object> get props => [images];
}

class Error extends Content with EquatableMixin {
  Error({required List<CatImage> images}): super(images: images);

  @override
  List<Object> get props => [images];
}