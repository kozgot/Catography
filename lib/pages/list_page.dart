import 'package:catography/data/image_data_store.dart';
import 'package:catography/widgets/grid_item_widget.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  var startingIndex = 0;
  final listOffset = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image List"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          childAspectRatio: 1 / 1,
        ),
        itemBuilder: (context, index) {
          var item = StockPhoto.fromId(index);
          return GridItemWidget(item: item);
        },
      ),
    );
  }
}
