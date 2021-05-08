import 'package:flutter/foundation.dart';

@immutable
abstract class ImageDetailsEvent {
  const ImageDetailsEvent();
}

class LoadImageEvent extends ImageDetailsEvent {
  final String id;

  LoadImageEvent(this.id);
}
