import 'package:flutter/cupertino.dart';

class OrderProvider  with ChangeNotifier{
  List<Map<String, dynamic>> orders =[];
  int? selectedOrders;

  void getLatestOrders(order){
    orders = order;
    notifyListeners();
  }

  void getSelectedOrder(selected){
    selectedOrders = selected;
    notifyListeners();
  }
}