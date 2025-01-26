import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../util/widget_constants.dart';
import 'invoice_details_data_table_source.dart';

class InvoiceDetailsDataTable extends StatefulWidget {
  const InvoiceDetailsDataTable({super.key, required this.selectedInvoice});


  final List<Map<String, dynamic>> selectedInvoice;

  @override
  State<InvoiceDetailsDataTable> createState() => _InvoiceDetailsDataTableState();
}

class _InvoiceDetailsDataTableState extends State<InvoiceDetailsDataTable> {

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      child: PaginatedDataTable(
        showCheckboxColumn: false,
        columns: widget.selectedInvoice.first.keys.map((key) {
          return DataColumn(label: Row(
            spacing: 10,
            children: [
              Text(key),
            ],
          ), numeric: key=='numeric'? true : false,
          );
        }).toList(),
        source: InvoiceDetailsDataSource(selectedInvoice: widget.selectedInvoice, context: context),
        showEmptyRows: false,
        rowsPerPage: widget.selectedInvoice.length,
      ),
    );
  }
}
