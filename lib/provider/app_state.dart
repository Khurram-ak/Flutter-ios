import 'package:flutter/cupertino.dart';

class AppState with ChangeNotifier{
  String _planeId = '';

  setPlaneId(planeId) {
    _planeId = planeId;
    notifyListeners();
  }

  String get planeId => _planeId;
}