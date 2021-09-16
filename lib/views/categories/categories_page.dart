import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/components/listTileEntry.dart';
import 'package:mobile/models/entry_model.dart';


class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(itemCount: data.length, 
      itemBuilder: (BuildContext context, int index) => EntryItem(data[index])
      ),
    );
  }
}

final List<Entry> data = <Entry>[
  Entry('Сырная продукция',
  <Entry>[
    Entry('Эллазон'),
    Entry('Золото колчака'),
    Entry('Cheesky'),
    Entry('Чечил'),
    Entry('Сырный бочонок'),
    Entry('Домашний'),
  ]),
  Entry('Рыбная продукция'),
  Entry('Мясная продукция'),
  Entry('Снековая продукция'),
  Entry('Инвентарь'),
];

