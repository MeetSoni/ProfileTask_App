import 'package:flutter/material.dart';
//import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Item {
  const Item(this.name);
  final String name;
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Color currentColor = Colors.white;

  void changeColor(Color color) => setState(() => currentColor = color);
  DateTime _dateTime;
  List<Item> users = <Item>[
    const Item('Andhra Pradesh'),
    const Item(
      'Arunachal Pradesh',
    ),
    const Item(
      'Asom (Assam)',
    ),
    const Item('Bihar'),
    const Item('Chhattisgarh'),
    const Item('Goa'),
    const Item('Gujarat'),
    const Item('Haryana'),
    const Item('Himachal Pradesh'),
    const Item('Jammu and Kashmir'),
    const Item('Jharkhand'),
    const Item('Karnataka'),
    const Item('Kerala'),
    const Item('Madhya Pradesh'),
    const Item('Maharashtra'),
    const Item('Manipur'),
    const Item('Meghalaya'),
    const Item('Mizoram'),
    const Item('Nagaland'),
    const Item('Orissa'),
    const Item('Punjab'),
    const Item('Rajasthan'),
    const Item('Sikkim'),
    const Item('Tamil Nadu'),
    const Item('Telangana'),
    const Item('Tripura'),
    const Item('Uttarakhand'),
    const Item('Uttar Pradesh'),
  ];
  Item selectedUser;

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            title: Text('Profile App'),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "Meet Soni : 9265288952",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  })
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 700,
              color: Colors.grey.shade200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTTOkHm3_mPQ5PPRvGtU6Si7FJg8DVDtZ47rw&usqp=CAU'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        contentPadding: EdgeInsets.all(20),
                        prefixIcon: Icon(Icons.arrow_forward),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Address',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        contentPadding: EdgeInsets.all(20),
                        prefixIcon: Icon(Icons.arrow_forward),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 340,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 300,
                          margin: EdgeInsets.all(20),
                          child: RaisedButton(
                              child: Text(_dateTime == null
                                  ? 'Enter Your Birth Date Here ...'
                                  : _dateTime.toString()),
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2222))
                                    .then((date) {
                                  setState(() {
                                    _dateTime = date;
                                  });
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 340,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 300,
                          child: RaisedButton(
                              elevation: 3.0,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      titlePadding: const EdgeInsets.all(0.0),
                                      contentPadding: const EdgeInsets.all(0.0),
                                      content: SingleChildScrollView(
                                        child: ColorPicker(
                                          pickerColor: currentColor,
                                          onColorChanged: changeColor,
                                          colorPickerWidth: 300.0,
                                          pickerAreaHeightPercent: 0.7,
                                          enableAlpha: true,
                                          displayThumbColor: true,
                                          showLabel: true,
                                          paletteType: PaletteType.hsv,
                                          pickerAreaBorderRadius:
                                              const BorderRadius.only(
                                            topLeft: const Radius.circular(2.0),
                                            topRight:
                                                const Radius.circular(2.0),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Text('Choose your color'),
                              color: currentColor,
                              textColor: Colors.black54),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 340,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 320,
                          child: RaisedButton(
                            onPressed: null,
                            child: DropdownButton<Item>(
                              hint: Text(" Select State"),
                              value: selectedUser,
                              onChanged: (Item Value) {
                                setState(() {
                                  selectedUser = Value;
                                });
                              },
                              items: users.map((Item user) {
                                return DropdownMenuItem<Item>(
                                  value: user,
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        user.name,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                      child: MaterialButton(
                          elevation: 50,
                          child: Text('Submit'),
                          onPressed: null),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
