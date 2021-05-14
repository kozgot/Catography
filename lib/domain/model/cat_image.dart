import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'breed.dart';

@immutable
class CatImage extends Equatable implements Comparable {
  final String id;
  final String url;
  final int width;
  final int height;
  final String? subId;
  final String? originalFileName;
  final String? breedId;
  final DateTime createdAt;
  final Breed? breed;

  const CatImage({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
    required this.subId,
    required this.originalFileName,
    required this.breedId,
    required this.createdAt,
    required this.breed,
  });

  CatImage copyWith({
    String? id,
    String? url,
    int? width,
    int? height,
    String? subId,
    String? originalFileName,
    String? breedId,
    DateTime? createdAt,
    Breed? breed,
  }) {
    return new CatImage(
      id: id ?? this.id,
      url: url ?? this.url,
      width: width ?? this.width,
      height: height ?? this.height,
      subId: subId ?? this.subId,
      originalFileName: originalFileName ?? this.originalFileName,
      breedId: breedId ?? this.breedId,
      createdAt: createdAt ?? this.createdAt,
      breed: breed ?? this.breed,
    );
  }

  @override
  List<Object?> get props => [
    id,
    url,
    width,
    height,
    subId,
    originalFileName,
    breedId,
    createdAt,
    breed,
  ];

  @override
  int compareTo(other) {
    if (this.createdAt.isBefore(other.createdAt)) {
      return 1;
    }

    if (this.createdAt.isAfter(other.createdAt)) {
      return -1;
    }

    return 0;
  }
}