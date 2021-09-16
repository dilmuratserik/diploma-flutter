import 'package:flutter/material.dart';
import 'package:mobile/models/entry_model.dart';

class EntryItem extends StatelessWidget{
  const EntryItem(this.entry);
  final Entry entry;

  Widget _buildTiles(Entry root){
    if (root.children.isEmpty){
      return ListTile(title: Text(root.title));
    }

    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
    // TODO: implement build
    throw UnimplementedError();
  }
}