import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/components/listTileEntry.dart';
import 'package:mobile/models/entry_model.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key, required this.isSalesRep}) : super(key: key);
  final bool isSalesRep;

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isSalesRep
          ? AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text('Категории',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              brightness: Brightness.light,
              automaticallyImplyLeading: true,
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              bottomOpacity: 1,
              iconTheme: IconThemeData(color: Colors.black))
          : null,
      body: Container(
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) =>
                EntryItem(data[index], widget.isSalesRep)),
      ),
    );
  }
}

final List<Entry> data = <Entry>[
  Entry('Сырная продукция', <Entry>[
    Entry('Эллазон'),
    Entry('Золото колчака'),
    Entry('Cheesky'),
    Entry('Чечил'),
    Entry('Сырный бочонок'),
    Entry('Домашний'),
  ]),
  Entry('Рыбная продукция', <Entry>[
    Entry('Test'),
  ]),
  Entry('Мясная продукция', <Entry>[
    Entry('Test'),
  ]),
  Entry('Снековая продукция', <Entry>[
    Entry('Test'),
  ]),
  Entry('Инвентарь', <Entry>[
    Entry('Test'),
  ]),
];
