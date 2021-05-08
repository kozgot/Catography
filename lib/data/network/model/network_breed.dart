import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_breed.g.dart';

@immutable
@JsonSerializable()
class NetworkBreed {
  final String name;
  final String id;
  final String temperament;
  final String origin;

  @JsonKey(name: "life_span")
  final String lifeSpan;

  final String description;
  final int indoor;
  final int lap;

  @JsonKey(name: "alt_names")
  final String altNames;

  final int adaptability;

  @JsonKey(name: "affection_level")
  final int affectionLevel;

  @JsonKey(name: "child_friendly")
  final int childFriendly;

  @JsonKey(name: "dog_friendly")
  final int dogFriendly;

  @JsonKey(name: "energy_level")
  final int energyLevel;

  final int grooming;

  @JsonKey(name: "health_issues")
  final int healthIssues;

  final int intelligence;

  @JsonKey(name: "shedding_level")
  final int sheddingLevel;

  @JsonKey(name: "social_needs")
  final int socialNeeds;

  @JsonKey(name: "stranger_friendly")
  final int strangerFriendly;

  final int vocalisation;
  final int experimental;
  final int hairless;
  final int natural;
  final int rare;
  final int rex;

  @JsonKey(name: "suppressed_tail")
  final int suppressedTail;

  @JsonKey(name: "short_legs")
  final int shortLegs;

  final int hypoallergenic;

  @JsonKey(name: "reference_image_id")
  final String referenceImageId;  // get the reference image like this: "https://cdn2.thecatapi.com/images/{referenceImageId}.jpg"

  NetworkBreed(
      this.name,
      this.id,
      this.temperament,
      this.origin,
      this.lifeSpan,
      this.description,
      this.indoor,
      this.lap,
      this.altNames,
      this.adaptability,
      this.affectionLevel,
      this.childFriendly,
      this.dogFriendly,
      this.energyLevel,
      this.grooming,
      this.healthIssues,
      this.intelligence,
      this.sheddingLevel,
      this.socialNeeds,
      this.strangerFriendly,
      this.vocalisation,
      this.experimental,
      this.hairless,
      this.natural,
      this.rare,
      this.rex,
      this.suppressedTail,
      this.shortLegs,
      this.hypoallergenic,
      this.referenceImageId
  );

  static const fromJsonFactory = _$NetworkBreedFromJson;

  factory NetworkBreed.fromJson(Map<String, dynamic> json) => _$NetworkBreedFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkBreedToJson(this);
}