import 'package:catography/data/image_data_store.dart';
import 'package:catography/pages/detailed_page.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final StockPhoto item;

  const ListItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: AspectRatio(
          aspectRatio: 1 / 1,
          child: Hero(
            tag: item.id,
            child: Image.network(
              item.url,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(item.title),
        subtitle: Text(
          item.description,
          maxLines: 1,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailedPage(
                photo: item,
              ),
            ),
          );
        },
      ),
    );
  }
}