import 'file:///E:/flutter_assignment/details_app/lib/Bloc/DetailsBloc.dart';
import 'package:flutter/cupertino.dart';

class GlobalBloc extends InheritedWidget {
  DetailsBloc detailsBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  GlobalBloc({
    Key key,
    Widget child,
  })  : detailsBloc = new DetailsBloc(),
        super(key: key, child: child);

  static DetailsBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(GlobalBloc) as GlobalBloc)
        .detailsBloc;
  }
}
