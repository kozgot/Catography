import 'package:catography/data/network/model/network_image.dart';
import 'package:catography/domain/model/breed.dart';
import 'package:catography/domain/model/cat_image.dart';

import 'cat_api.dart';
import 'model/network_breed.dart';

class ImageNetworkDataSource {
  final CatApi _catApi;

  ImageNetworkDataSource(this._catApi);

  Future<List<CatImage>?> getImages() async {
    final networkResponse = await _catApi.getImages();
    if (networkResponse.response.statusCode != 200) return null;

    final networkImages = networkResponse.data.toList();
    return networkImages.map((catImage) => catImage.toDomainModel()).toList();
  }
}

extension on NetworkCatImage {
  CatImage toDomainModel() {
    final breed = this.breeds.length > 0 ? breeds[0].toDomainModel() : null;
    var parsedDate = this.createdAt != null ? DateTime.parse(this.createdAt!) : new DateTime.now();

    return CatImage(
      id: this.id,
      url: this.url,
      width: this.width,
      height: this.height,
      subId: this.subId,
      originalFileName: this.originalFilename,
      breedId: this.breedIds,
      createdAt: parsedDate,
      breed: breed,
    );
  }
}

extension on NetworkBreed {
  Breed toDomainModel() {

    return Breed(
      id: this.id,
        name: this.name,
        temperament: this.temperament,
        origin: this.origin,
        lifeSpan: this.lifeSpan,
        description: this.description,
        indoor: this.indoor == 1,
        lap: this.lap == 1,
        altNames: this.altNames,
        adaptability: this.adaptability,
        affectionLevel: this.affectionLevel,
        childFriendly: this.childFriendly,
        dogFriendly: this.dogFriendly,
        energyLevel: this.energyLevel,
        grooming: this.grooming,
        healthIssues: this.healthIssues,
        intelligence: this.intelligence,
        sheddingLevel: this.sheddingLevel,
        socialNeeds: this.socialNeeds,
        strangerFriendly: this.strangerFriendly,
        vocalisation: this.vocalisation,
        experimental: this.experimental == 1,
        hairless: this.hairless == 1,
        natural: this.natural == 1,
        rare: this.rare == 1,
        rex: this.rex == 1,
        suppressedTail: this.suppressedTail == 1,
        shortLegs: this.shortLegs == 1,
        hypoallergenic: this.hypoallergenic == 1,
        referenceImageId: this.referenceImageId
    );
  }
}
