import 'package:catography/data/network/cat_api.dart';
import 'package:catography/data/network/dio_cat_service.dart';
import 'package:catography/data/network/image_network_data_source.dart';
import 'package:catography/domain/interactor/image_interactor.dart';
import 'package:catography/ui/images/image_list_bloc.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void initDependencies() {
  injector.registerSingleton<CatApi>(CatService());

  injector.registerSingleton(
    ImageNetworkDataSource(injector<CatApi>()),
  );

  injector.registerSingletonAsync(
        () async {
      return ImageInteractor(
        injector<ImageNetworkDataSource>(),
      );
    },
  );

  injector.registerFactory(
        () => ImageListBloc(
      injector<ImageInteractor>(),
    ),
  );
}
