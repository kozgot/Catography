import 'package:catography/data/network/image_network_data_source.dart';
import 'package:catography/domain/model/cat_image.dart';
import 'package:flutter/foundation.dart';

class ImageInteractor {
  final ImageNetworkDataSource _imageNetworkDataSource;

  ImageInteractor(
      this._imageNetworkDataSource,
      );

  Future<List<CatImage>> getCatImages() async {
    debugPrint("Downloading images from the network");
    return await _imageNetworkDataSource.getImages() ?? [];
  }

  Future<CatImage?> getImageById(String id) async{
    print("Getting image $id from API");
    return await _imageNetworkDataSource.getImageById(id);
  }
}
