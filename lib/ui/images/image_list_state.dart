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
  final bool descendingOrder;

  Content({required this.images, required this.descendingOrder});
}

class ContentReady extends Content with EquatableMixin {
  ContentReady({required List<CatImage> images, required bool descendingOrder}): super(images: images, descendingOrder: descendingOrder);

  @override
  List<Object> get props => [images, descendingOrder];
}

class OrderChanged extends Content with EquatableMixin {
  OrderChanged({required List<CatImage> images, required bool descendingOrder}): super(images: images, descendingOrder: descendingOrder);

  @override
  List<Object> get props => [images, descendingOrder];
}

class Error extends Content with EquatableMixin {
  Error({required List<CatImage> images, required bool descendingOrder}): super(images: images, descendingOrder: descendingOrder);

  @override
  List<Object> get props => [images, descendingOrder];
}