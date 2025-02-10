import 'package:flutter/material.dart';

class Favouriteprovider extends ChangeNotifier {
  final List<Map<String, dynamic>> favlist = [];

  void addProduct(Map<String, dynamic> item) {
    favlist.add(item);
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> item) {
    favlist.remove(item);
    notifyListeners();
  }
}
