import 'package:details_app/UI/ViewDetails.dart';
import 'package:flutter/material.dart';
import 'package:details_app/GlobalBloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final genders = ["Male", "Female", "Other"];
  int radioGroup = 0;
  String name;
  String address;
  String _selectedGender;
  String _martialStatus;

  @override
  Widget build(BuildContext context) {
    final bloc = GlobalBloc.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Information"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(fontSize: 15,
                  color : Colors.green),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              BorderSide(color: Colors.blue[700], width: 0.5)),
                      hintText: "Enter Name"),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLines: 3,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              BorderSide(color: Colors.blue[700], width: 0.5)),
                      hintText: "Enter Address"),
                  onChanged: (value) {
                    address = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                InputDecorator(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              BorderSide(color: Colors.blue[700], width: 0.5)),
                      hintText: "Enter Address"),
                  isEmpty: _selectedGender == '',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedGender,
                      isDense: true,
                      onChanged: (String newValue) {
                        setState(() {
                          _selectedGender = newValue;
                        });
                      },
                      items: genders.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Radio(
                      activeColor: Colors.black,
                      groupValue: radioGroup,
                      value: "Married",
                      onChanged: (value) {
                        setState(() {
                          print(value);
                          _martialStatus = value;
                        });
                      },
                    ),
                    new Text(
                      'Married',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Radio(
                      activeColor: Colors.black,
                      groupValue: radioGroup,
                      value: "Single",
                      onChanged: (value) {
                        setState(() {
                          print(value);
                          _martialStatus = value;
                        });
                      },
                    ),
                    new Text(
                      'Single',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  onPressed: () {
                    bloc.newDetails(
                        name, address, _selectedGender, _martialStatus);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ViewDetails()));
                  },
                  color: Colors.blue[700],
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
