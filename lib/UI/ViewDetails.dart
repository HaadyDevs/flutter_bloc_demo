import 'file:///E:/flutter_assignment/details_app/lib/Bloc/DetailsBloc.dart';
import 'file:///E:/flutter_assignment/details_app/lib/Models/DetailsModel.dart';
import 'package:flutter/material.dart';

import '../GlobalBloc.dart';

class ViewDetails extends StatefulWidget {
  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  DetailsBloc bloc;
  @override
  Widget build(BuildContext context) {
    bloc = GlobalBloc.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("View Details"),
      ),
      body: StreamBuilder<DetailModel>(
          stream: bloc.detailsStream,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              DetailModel details = snapshot.data;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue[900],
                      ),
                    ),
                    Text(
                      details.name,
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Address",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red[900],
                      ),
                    ),
                    Text(
                      details.address,
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Gender",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue[900],
                      ),
                    ),
                    Text(
                      details.gender,
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Martial Status",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue[900],
                      ),
                    ),
                    Text(
                      details.martial,
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}
