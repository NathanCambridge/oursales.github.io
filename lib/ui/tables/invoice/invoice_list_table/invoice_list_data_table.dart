import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oursales/ui/pages/invoices/invoice_list.dart';
import '../../../../util/widget_constants.dart';
import 'data_table_source.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' as shadcn;

class InvoiceListDataTable extends StatefulWidget {
  const InvoiceListDataTable({super.key, required this.invoices});


  final List<Map<String, dynamic>> invoices;

  @override
  State<InvoiceListDataTable> createState() => _InvoiceListDataTableState();
}

class _InvoiceListDataTableState extends State<InvoiceListDataTable> {

  bool _isAscending = true; // Track sorting order
  int _sortColumnIndex = 0; // Track the current sorted column index

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Theme(
              data: Theme.of(context).copyWith(
                dataTableTheme: const DataTableThemeData(
                  dividerThickness: 0.2,
                  // [headingRowColor] will change table header background
                  // headingRowColor: WidgetStatePropertyAll(Colors.red),
                  // [dataRowColor] will change table rows background
                  // dataRowColor: WidgetStatePropertyAll(Colors.green),
                ),
                // After override table header and row background, this [cardTheme]
                // will affect only for table footer background.
                cardTheme:  CardTheme(color: shadcn.Theme.of(context).colorScheme.background,
                ),
              ),
              child: PaginatedDataTable(
                headingRowColor:   WidgetStateColor.resolveWith((states) => shadcn.Theme.of(context).colorScheme.background),
                showCheckboxColumn: false,
                columns: invoices.first.keys.map((key) {
                  return DataColumn(label: Row(
                    spacing: 10,
                    children: [
                      shadcn.Text(key),
                      Icon(shadcn.LucideIcons.arrowUpDown, size: kWidgetFontSize,)
                    ],
                  ), numeric: key=='Amount'? true : false,
                    onSort:  (columnIndex, ascending) => _sort((invoices) => invoices[key], columnIndex, _isAscending),
                  );
                }).toList(),
                source: InvoiceDataSource(invoices, context),
                rowsPerPage: invoices.length > 19 ? 20 : invoices.length,
                showEmptyRows: false,
              ),
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
