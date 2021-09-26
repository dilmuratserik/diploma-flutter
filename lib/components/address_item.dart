import 'package:flutter/material.dart';
import 'package:mobile/views/profile/add_new_address.dart';
import 'package:mobile/views/utills/const.dart';

class AddressItem extends StatelessWidget{
  const AddressItem();
  // final Entry entry;

  @override
  Widget build(BuildContext context) {
    // return _buildTiles(entry);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.gold,
        child: Icon(Icons.home, color: Colors.white,)
      ),
      title: Text("Микрорайон Аксай-1, 1к2"),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewAddressPage()));
      },
    );
  }
}