import 'package:flutter/material.dart';
import 'package:mobile/models/entry_model.dart';
import 'package:mobile/views/categories/category_products.dart';

class EntryItem extends StatelessWidget{
  const EntryItem(this.entry);
  final Entry entry;

  @override
  Widget build(BuildContext context) {
    // return _buildTiles(entry);
    return ExpansionTile(
        key: PageStorageKey<Entry>(entry),
        title: Text(entry.title),
        children: <Widget>[
          for (int i = 0; i < entry.children.length; i++) ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryProductsPage(title: entry.children[i].title,)));
            },
            title: Text(entry.children[i].title,style: TextStyle(fontWeight: FontWeight.w500)),
          )
        ]
      );
  }
}