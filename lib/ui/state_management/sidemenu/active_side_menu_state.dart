import 'package:flutter/cupertino.dart';

class SideMenuProvider  with ChangeNotifier{
  String activeMenu = 'dashboard';
   bool sideMenuExpanded = false;

  void getActiveMenu(active){
    activeMenu = active;
    notifyListeners();
  }

  void getSideMenuState(state){
    sideMenuExpanded = state;
    notifyListeners();
  }
}