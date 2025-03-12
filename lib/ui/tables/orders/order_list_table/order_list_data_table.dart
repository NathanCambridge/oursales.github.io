import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oursales/ui/pages/invoices/invoice_list.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../../../util/widget_constants.dart';
import 'data_table_source.dart';

class OrderListDataTable extends StatefulWidget {
  const OrderListDataTable({super.key, required this.orders});

  final List<Map<String, dynamic>> orders;

  @override
  State<OrderListDataTable> createState() => _OrderListDataTableState();
}

class _OrderListDataTableState extends State<OrderListDataTable> {
  bool _isAscending = true; // Track sorting order
  int _sortColumnIndex = 0; // Track the current sorted column index

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: PaginatedDataTable(
              showCheckboxColumn: false,
              columns: invoices.first.keys.map((key) {
                return DataColumn(
                  label: Row(
                    spacing: 10,
                    children: [
                      Text(key),
                      Icon(
                        LucideIcons.arrowUpDown,
                        size: kWidgetFontSize,
                      )
                    ],
                  ),
                  numeric: key == 'Amount' ? true : false,
                  onSort: (columnIndex, ascending) => _sort((invoices) => invoices[key], columnIndex, _isAscending),
                );
              }).toList(),
              source: OrderDataSource(invoices, context),
              rowsPerPage: invoices.length > 9 ? 10 : invoices.length,
              showEmptyRows: false,
            ),
          ),
        ),
      ),
    );
  }

  void _sort<T>(Comparable<T> Function(Map<String, dynamic> row) getField, int columnIndex, bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _isAscending = !ascending;
      invoices.sort((a, b) {
        final aValue = getField(a);
        final bValue = getField(b);
        return ascending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
      });
    });
  }
}
