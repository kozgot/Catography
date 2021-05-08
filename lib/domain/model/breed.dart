import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Breed extends Equatable {
  final String name;
  final String id;
  final String temperament;
  final String origin;
  final String lifeSpan;
  final String description;
  final bool indoor;
  final bool lap;
  final String altNames;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final bool experimental;
  final bool hairless;
  final bool natural;
  final bool rare;
  final bool rex;
  final bool suppressedTail;
  final bool shortLegs;
  final bool hypoallergenic;
  final String referenceImageId;  // get the reference image like this: "https://cdn2.thecatapi.com/images/{referenceImageId}.jpg"

  const Breed({
    required this.id,
    required this.name,
    required this.origin,
    required this.temperament,
    required this.lifeSpan,
    required this.description,
    required this.indoor,
    required this.lap,
    required this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.hypoallergenic,
    required this.referenceImageId
  });

  Breed copyWith({
    String? id,
    String? name,
    String? origin,
    String? temperament,
    String? lifespan,
    String? description,
    bool? indoor,
    bool? lap,
    String? altNames,
    int? adaptability,
    int? affectionLevel,
    int? childFriendly,
    int? dogFriendly,
    int? energyLevel,
    int? grooming,
    int? healthIssues,
    int? intelligence,
    int? sheddingLevel,
    int? socialNeeds,
    int? strangerFriendly,
    int? vocalisation,
    bool? experimental,
    bool? hairless,
    bool? natural,
    bool? rare,
    bool? rex,
    bool? suppressedTail,
    bool? shortLegs,
    bool? hypoallergenic,
    String? referenceImageId
  }) {
    return new Breed(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      origin: origin ?? this.origin,
      temperament: temperament ?? this.temperament,
      lifeSpan: lifespan ?? this.lifeSpan,
      indoor: indoor ?? this.indoor,
      lap: lap ?? this.lap,
      altNames: altNames ?? this.altNames,
      adaptability: adaptability ?? this.adaptability,
      affectionLevel: affectionLevel ?? this.affectionLevel,
      childFriendly: childFriendly ?? this.childFriendly,
      dogFriendly: dogFriendly ?? this.dogFriendly,
      energyLevel: energyLevel ?? this.energyLevel,
      grooming: grooming ?? this.grooming,
      healthIssues: healthIssues ?? this.healthIssues,
      intelligence: intelligence ?? this.intelligence,
      sheddingLevel: sheddingLevel ?? this.sheddingLevel,
      socialNeeds: socialNeeds ?? this.socialNeeds,
      strangerFriendly: strangerFriendly ?? this.strangerFriendly,
      vocalisation: vocalisation ?? this.vocalisation,
      experimental: experimental ?? this.experimental,
      hairless: hairless ?? this.hairless,
      natural: natural ?? this.natural,
      rare: rare ?? this.rare,
      rex: rex ?? this.rex,
      suppressedTail: suppressedTail ?? this.suppressedTail,
      shortLegs: shortLegs ?? this.shortLegs,
      hypoallergenic: hypoallergenic ?? this.hypoallergenic,
      referenceImageId: referenceImageId ?? this.referenceImageId,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    origin,
    temperament,
    lifeSpan,
    indoor,
    lap,
    altNames,
    adaptability,
    affectionLevel,
    childFriendly,
    dogFriendly,
    energyLevel,
    grooming,
    healthIssues,
    intelligence,
    sheddingLevel,
    socialNeeds,
    strangerFriendly,
    vocalisation,
    experimental,
    hairless,
    natural,
    rare,
    rex,
    suppressedTail,
    shortLegs,
    hypoallergenic,
    referenceImageId,
  ];
}