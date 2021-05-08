import 'package:catography/domain/model/cat_image.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ImageDetailsState {
  const ImageDetailsState();
}

class Loading extends ImageDetailsState {
  static final Loading _instance = Loading._();

  factory Loading() => _instance;

  Loading._();
}

class Error extends ImageDetailsState {
  static final Error _instance = Error._();

  factory Error() => _instance;

  Error._();
}

class ContentReady extends ImageDetailsState with EquatableMixin {
  final CatImage catImage;

  ContentReady({required this.catImage});

  @override
  List<Object> get props => [catImage];
}