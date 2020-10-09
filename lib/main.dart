import 'file:///E:/flutter_assignment/details_app/lib/Bloc/DetailsBloc.dart';
import 'package:details_app/GlobalBloc.dart';
import 'file:///E:/flutter_assignment/details_app/lib/UI/ViewDetails.dart';
import 'package:flutter/material.dart';
import 'package:details_app/UI/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobalBloc(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}
