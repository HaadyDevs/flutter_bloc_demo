import 'dart:async';
import 'file:///E:/flutter_assignment/details_app/lib/Models/DetailsModel.dart';

class DetailsBloc {
  DetailModel detailModel;

  final detailController = StreamController<DetailModel>();

  Stream<DetailModel> get detailsStream => detailController.stream;

  void newDetails(String name, String address, String gender, String martial) {
    detailModel = new DetailModel(
        name: name, address: address, gender: gender, martial: martial);
    detailController.sink.add(detailModel);
  }

  void dispose() {
    detailController.close();
  }
}
