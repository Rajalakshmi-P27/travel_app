import 'package:flutter/material.dart';

class Cartproviders extends ChangeNotifier {
  final List<Map<String, dynamic>> cartlist = [];

  void addProduct(Map<String, dynamic> item) {
    cartlist.add(item);
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> item) {
    cartlist.remove(item);
    notifyListeners();
  }
}
