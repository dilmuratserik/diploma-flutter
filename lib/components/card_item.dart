import 'package:flutter/material.dart';
import 'package:mobile/views/profile/add_new_card.dart';
import 'package:mobile/views/utills/const.dart';

class CardItem extends StatelessWidget{
  const CardItem();
  // final Entry entry;

  @override
  Widget build(BuildContext context) {
    // return _buildTiles(entry);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.gold,
        child: Icon(Icons.credit_card, color: Colors.white,)
      ),
      title: Text("MasterCard, *5588"),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewCardPage()));
      },
    );
  }
}