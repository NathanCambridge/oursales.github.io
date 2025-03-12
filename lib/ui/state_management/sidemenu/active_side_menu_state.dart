import 'package:flutter/cupertino.dart';

class SideMenuProvider  with ChangeNotifier{
  String activeMenu = 'dashboard';

  void getActiveMenu(active){
    activeMenu = active;
    notifyListeners();
  }
}