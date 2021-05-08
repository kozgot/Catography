// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_breed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkBreed _$NetworkBreedFromJson(Map<String, dynamic> json) {
  return NetworkBreed(
    json['name'] as String,
    json['id'] as String,
    json['temperament'] as String?,
    json['origin'] as String,
    json['life_span'] as String?,
    json['description'] as String?,
    json['indoor'] as int?,
    json['lap'] as int?,
    json['alt_names'] as String?,
    json['adaptability'] as int?,
    json['affection_level'] as int?,
    json['child_friendly'] as int?,
    json['dog_friendly'] as int?,
    json['energy_level'] as int?,
    json['grooming'] as int?,
    json['health_issues'] as int?,
    json['intelligence'] as int?,
    json['shedding_level'] as int?,
    json['social_needs'] as int?,
    json['stranger_friendly'] as int?,
    json['vocalisation'] as int?,
    json['experimental'] as int?,
    json['hairless'] as int?,
    json['natural'] as int?,
    json['rare'] as int?,
    json['rex'] as int?,
    json['suppressed_tail'] as int?,
    json['short_legs'] as int?,
    json['hypoallergenic'] as int?,
    json['reference_image_id'] as String?,
  );
}

Map<String, dynamic> _$NetworkBreedToJson(NetworkBreed instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'temperament': instance.temperament,
      'origin': instance.origin,
      'life_span': instance.lifeSpan,
      'description': instance.description,
      'indoor': instance.indoor,
      'lap': instance.lap,
      'alt_names': instance.altNames,
      'adaptability': instance.adaptability,
      'affection_level': instance.affectionLevel,
      'child_friendly': instance.childFriendly,
      'dog_friendly': instance.dogFriendly,
      'energy_level': instance.energyLevel,
      'grooming': instance.grooming,
      'health_issues': instance.healthIssues,
      'intelligence': instance.intelligence,
      'shedding_level': instance.sheddingLevel,
      'social_needs': instance.socialNeeds,
      'stranger_friendly': instance.strangerFriendly,
      'vocalisation': instance.vocalisation,
      'experimental': instance.experimental,
      'hairless': instance.hairless,
      'natural': instance.natural,
      'rare': instance.rare,
      'rex': instance.rex,
      'suppressed_tail': instance.suppressedTail,
      'short_legs': instance.shortLegs,
      'hypoallergenic': instance.hypoallergenic,
      'reference_image_id': instance.referenceImageId,
    };
