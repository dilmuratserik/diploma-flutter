import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/components/address_item.dart';
import 'package:mobile/models/Address.dart';
import 'package:mobile/services/place_services.dart';
import 'package:mobile/services/profile_api_provider.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:uuid/uuid.dart';
import 'package:google_place/google_place.dart';
import 'add_new_address.dart';

class AddressesPage extends StatefulWidget {
  // AddressesPage(this.product);
  // final Product product;

  @override
  _AddressesPageState createState() => _AddressesPageState();
}

class _AddressesPageState extends State<AddressesPage> {

  List<Address> listAddresses = [];

  @override
  void initState() {
    getAddresses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text('Адреса',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              automaticallyImplyLeading: true,
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              bottomOpacity: 1,
              iconTheme: IconThemeData(color: Colors.black)),
          body: Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.73,
                  child: ListView.separated(
                      itemCount: listAddresses.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            child: AddressItem(address: listAddresses[index]));
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      })),
              Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Center(child: getButton('ДОБАВИТЬ АДРЕС')),
              ),
                // GestureDetector(
                //     onTap: ()async {
                //       final sessionToken = Uuid().v4();
                //       final List<Suggestion> result =
                //       await PlaceApiProvider(sessionToken)
                //           .fetchSuggestions("al", "en");
                //       print(result);
                //       var googlePlace = GooglePlace("AIzaSyDBEeXLvg0e1GqozypzQHBgZSQWFNHcMvc");
                //       var risult = await googlePlace.autocomplete.get("1600 Amphitheatre");
                //       print(risult);
                //     },
                //     child: Text(asd))
            ],
          ),
        ));
  }
  String asd = "asd";
  void _onChanged() {
    listAddresses.clear();
    getAddresses();
  }

  Widget getButton(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20,right: 20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewAddressPage(address: null, onChanged: _onChanged,)));
        },
        style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 30), // double.infinity is the width and 30 is the height
            primary: AppColors.green,
            padding: EdgeInsets.symmetric( vertical: 17),
            textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto")),
        child: Text(text),
      ),
    );
  }



  void getAddresses() async {
     List<dynamic> response =await ProfileProvider().getAddresses();

    if (response[0]["status"] != 'Error') {
      setState(() {
        for (var i in response) {
          listAddresses.add(Address.fromJson(i));
        }
      });
      // final snackBar = SnackBar(content: Text('Данные изменены'));
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else {
      final snackBar = SnackBar(content: Text('Проверьте соединение с интернетом, или повторите позже!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
