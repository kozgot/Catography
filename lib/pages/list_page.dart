import 'package:catography/data/image_data_store.dart';
import 'package:flutter/material.dart';
import '../widgets/list_item_widget.dart';

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // ... is the spread operator
              ...Iterable.generate(
                10,
                    (id) {
                  var item = StockPhoto.fromId(id);
                  return ListItemWidget(
                    item: item,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
