import 'package:flutter/material.dart';
import 'package:mobile/models/Address.dart';
import 'package:mobile/views/profile/add_new_address.dart';
import 'package:mobile/views/utills/const.dart';

class AddressItem extends StatelessWidget{
   // final Entry entry;

  const AddressItem({
    Key? key,
    required this.address
  }) : super(key: key);

  final Address address;
  void _onChanged() {

  }
  @override
  Widget build(BuildContext context) {
    // return _buildTiles(entry);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.gold,
        child: Icon(Icons.home, color: Colors.white,)
      ),
      title: Text("Микрорайон ${address.street}, ${address.house}к${address.apartment}"),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewAddressPage(address: address,onChanged: _onChanged,)));
      },
    );
  }
}


