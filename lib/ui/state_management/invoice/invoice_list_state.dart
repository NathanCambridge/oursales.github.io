import 'package:flutter/cupertino.dart';

class InvoiceProvider  with ChangeNotifier{
  List<Map<String, dynamic>>? invoices;

  void getLatestInvoices(invoice){
    invoices = invoice;
    notifyListeners();
  }
}