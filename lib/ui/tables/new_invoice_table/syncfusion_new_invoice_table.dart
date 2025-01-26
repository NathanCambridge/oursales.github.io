import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// The home page of the application which hosts the datagrid.
class SyncFusionNewInvoiceTable extends StatefulWidget {
  /// Creates the home page.
  const SyncFusionNewInvoiceTable({super.key, required this.invoiceItems});

  final List<Map<String, dynamic>> invoiceItems;

  @override
  _SyncFusionNewInvoiceTableState createState() => _SyncFusionNewInvoiceTableState();
}

class _SyncFusionNewInvoiceTableState extends State<SyncFusionNewInvoiceTable> {
  @override
  Widget build(BuildContext context) {
    final textTheme = ShadTheme.of(context).textTheme;
    return Theme(
      data: ThemeData(
        dividerColor: Colors.grey.withOpacity(0.02), // Reduce gridline opacity
      ),
      child: SfDataGrid(
        selectionMode: SelectionMode.multiple,
        allowEditing: true,
        gridLinesVisibility: GridLinesVisibility.horizontal,
        headerGridLinesVisibility: GridLinesVisibility.horizontal,
        source: NewInvoiceDataSource(invoiceItems: widget.invoiceItems),
        columnWidthMode: ColumnWidthMode.fill,
        columns: widget.invoiceItems.first.keys.map((key) {
          return GridColumn(
            columnName: key,
            label: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text(
                key.toUpperCase(),
                style: textTheme.small.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// Data source for the invoice items.
class NewInvoiceDataSource extends DataGridSource {
  /// Creates the invoice data source class with required details.
  NewInvoiceDataSource({required List<Map<String, dynamic>> invoiceItems}) {
    _invoiceItemsData = invoiceItems
        .asMap()
        .entries
        .map<DataGridRow>((entry) => DataGridRow(
      cells: entry.value.entries
          .map((e) => DataGridCell(columnName: e.key, value: e.value))
          .toList(),
    ))
        .toList();
  }

  List<DataGridRow> _invoiceItemsData = [];

  @override
  List<DataGridRow> get rows => _invoiceItemsData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    int index = _invoiceItemsData.indexOf(row);
    return DataGridRowAdapter(
      color: index % 2 != 0 ? Colors.grey[300] : Colors.white,
      cells: row.getCells().map<Widget>((e) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(8.0),
          child: Text(e.value.toString()),
        );
      }).toList(),
    );
  }
}
