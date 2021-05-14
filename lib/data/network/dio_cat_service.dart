import 'package:catography/data/network/model/network_image.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'cat_api.dart';

part 'dio_cat_service.g.dart';

@RestApi(baseUrl: "https://api.thecatapi.com/v1")
abstract class CatService implements CatApi {

  factory CatService() {
    final _dio = Dio();

    _dio.interceptors.add(
        InterceptorsWrapper(
            onRequest: (request, handler) {
              request.headers["x-api-key"] = "16d40230-356f-4ee1-83ab-b3b9189b52f4";
              handler.next(request);
            }
        )
    );
    _dio.interceptors.add(
        InterceptorsWrapper(
            onRequest: (request, handler) {
              request.queryParameters["limit"] = 100;
              handler.next(request);
            }
        )
    );
    _dio.interceptors.add(LogInterceptor());
    return _CatService(_dio);
  }

  @override
  @GET("/images")
  Future<HttpResponse<List<NetworkCatImage>>> getImages();
}