import 'package:flutter/material.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/models/plan_model.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:mobile/views/utills/hex_color.dart';

class PlaneDescriptionPage extends StatefulWidget {
  const PlaneDescriptionPage({Key? key, required this.plan}) : super(key: key);
  final Plan plan;

  @override
  _PlaneDescriptionPageState createState() => _PlaneDescriptionPageState();
}

class _PlaneDescriptionPageState extends State<PlaneDescriptionPage> {
  bool _switchValue1 = false;
  bool _switchValue2 = false;
  bool _switchValue3 = false;
  TextEditingController commentController = TextEditingController();
  FocusNode commentFocusNode = FocusNode();

  @override
  void initState() {
    widget.plan.plan ? _switchValue1 = true : _switchValue1 = false;
    widget.plan.fact ? _switchValue2 = true : _switchValue2 = false;
    widget.plan.fact ? _switchValue3 = true : _switchValue3 = false;
    commentController.text = widget.plan.comment;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title:
            Text('Визиты', style: TextStyle(color: Colors.black, fontSize: 18)),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        bottomOpacity: 1,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: GestureDetector(
                child: Text('Сохранить',
                    style: TextStyle(
                        color: AppColors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                onTap: () {
                  print('Save');
                }),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text("Код: " + widget.plan.id.toString(),
                            style: TextStyle(
                                color: AppColors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 22)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          widget.plan.date,
                          style: TextStyle(
                              color: AppColors.presentationGray, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Торговая точка",
                          style: TextStyle(
                              color: AppColors.presentationGray, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          widget.plan.pointName,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      getDivider(),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "План (выполнил или нет?)",
                                style: TextStyle(fontSize: 16),
                              ),
                              Switch(
                                  value: _switchValue1,
                                  activeColor: AppColors.gold,
                                  onChanged: (value) {
                                    // setState(() {
                                    //   _switchValue1 = value;
                                    // });
                                    // print("value ${value}");
                                  })
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Факт (выполнил или нет?)",
                                style: TextStyle(fontSize: 16),
                              ),
                              Switch(
                                  value: _switchValue2,
                                  activeColor: AppColors.gold,
                                  onChanged: (value) {
                                    setState(() {
                                      _switchValue2 = value;
                                    });
                                    print("value ${value}");
                                  })
                            ]),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            child: TextFormField(
                              onTap: () {},
                              enabled: false,
                              focusNode: commentFocusNode,
                              controller: commentController,
                              cursorColor: Colors.black,
                              maxLength: 30,
                              decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                      color: commentFocusNode.hasFocus
                                          ? AppColors.gold
                                          : Colors.grey),
                                  focusColor: Colors.grey,
                                  fillColor: Colors.grey,
                                  counterText: "",
                                  labelText: "Комментарий",
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.gold, width: 1))),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Заполните это поле';
                                }
                                return null;
                              },
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Есть фото?",
                                style: TextStyle(fontSize: 16),
                              ),
                              Switch(
                                  value: _switchValue3,
                                  activeColor: AppColors.gold,
                                  onChanged: (value) {
                                    setState(() {
                                      _switchValue3 = value;
                                    });
                                    print("value ${value}");
                                  })
                            ]),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          decoration:
                              BoxDecoration(color: HexColor.fromHex('EEF3F1')),
                          height: 200,
                          child: ListView.builder(
                              itemCount: 2,
                              itemBuilder: (BuildContext context, int index) =>
                                  ListTile(
                                      title: Text('photo.jpg'),
                                      trailing: GestureDetector(
                                          onTap: () {
                                            print('Delete');
                                          },
                                          child: Icon(
                                              Icons
                                                  .disabled_by_default_outlined,
                                              color: Colors.red[900])))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: getButton('ДОБАВИТЬ ФОТО'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getDivider() {
    return Divider(
      color: AppColors.presentationGray,
      indent: 1,
      endIndent: 1,
    );
  }
}
