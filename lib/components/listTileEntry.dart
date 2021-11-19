import 'package:flutter/material.dart';
import 'package:mobile/models/entry_model.dart';
import 'package:mobile/views/categories/category_products.dart';

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry, this.isSalesRep);
  final Entry entry;
  final bool isSalesRep;

  @override
  Widget build(BuildContext context) {
    // return _buildTiles(entry);
    return ExpansionTile(
        key: PageStorageKey<Entry>(entry),
        title: Text(entry.title),
        children: <Widget>[
          for (int i = 0; i < entry.children.length; i++)
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoryProductsPage(
                            entry.children[i].title, '1', '1', isSalesRep)));
              },
              title: Text(entry.children[i].title,
                  style: TextStyle(fontWeight: FontWeight.w500)),
            )
        ]);
  }
}
