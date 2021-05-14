import 'package:catography/domain/model/cat_image.dart';
import 'package:catography/ui/details/detailed_page.dart';
import 'package:catography/ui/images/images_page.dart';
import 'package:flutter/material.dart';
import 'di/di_utils.dart';

void main() {
  initDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(CatApp());
}

const DETAIL_PAGE = "/details";

class CatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: injector.allReady(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            title: 'Cute cat images',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: ImageListPage(),
            onGenerateRoute: (settings) {
              final name = settings.name ?? "";
              if (name.startsWith(DETAIL_PAGE)) {
                return MaterialPageRoute(
                  builder: (context) {
                    return ImageDetails(settings.arguments as CatImage);
                  },
                );
              }
              return null;
            },
          );
        }

        return Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
