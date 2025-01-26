import 'package:flutter/material.dart';
import 'new_invoice_data_table_source.dart';

class NewInvoiceDataTable extends StatefulWidget {
  const NewInvoiceDataTable({super.key, required this.invoiceItems});


  final List<Map<String, dynamic>> invoiceItems;

  @override
  State<NewInvoiceDataTable> createState() => _NewInvoiceDataTableState();
}

class _NewInvoiceDataTableState extends State<NewInvoiceDataTable> {

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      child: PaginatedDataTable(
        showCheckboxColumn: true,
        columns: widget.invoiceItems.first.keys.map((key) {
          return DataColumn(label: Row(
            spacing: 10,
            children: [
              Text(key),
            ],
          ), numeric: key=='numeric'? true : false,
          );
        }).toList(),
        source: NewInvoiceDataSource(invoiceItems: widget.invoiceItems, context: context),
        showEmptyRows: false,
        rowsPerPage: widget.invoiceItems.length,
      ),
    );
  }
}
