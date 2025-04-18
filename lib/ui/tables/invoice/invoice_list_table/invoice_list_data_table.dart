import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oursales/main.dart';
import 'package:oursales/ui/pages/invoices/invoice_list.dart';
import 'package:oursales/util/functions/capitalize_first_character.dart';
import '../../../../util/widget_constants.dart';
import 'data_table_source.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' as shadcn;

class InvoiceListDataTable extends ConsumerStatefulWidget {
  const InvoiceListDataTable({super.key});

  @override
  ConsumerState<InvoiceListDataTable> createState() => _InvoiceListDataTableState();
}

class _InvoiceListDataTableState extends ConsumerState<InvoiceListDataTable> {

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
                textTheme: Theme.of(context).textTheme.copyWith(
                  bodySmall: TextStyle( // Typically used for footer text
                    color: shadcn.Theme.of(context).colorScheme.cardForeground,// Optional: Adjust font size
                  ),
                ),
                iconTheme: IconThemeData(
                  color: shadcn.Theme.of(context).colorScheme.cardForeground // Change footer icon color
                ),
              ),
              child: PaginatedDataTable(
                headingRowColor:   WidgetStateColor.resolveWith((states) => shadcn.Theme.of(context).colorScheme.background),
                showCheckboxColumn: false,
                columns: ref.watch(invoiceProvider).invoices!.first.keys.map((key) {
                  return DataColumn(label: Row(
                    spacing: 10,
                    children: [
                      shadcn.Text(capitalizeFirstLetter(key), style: kBoldedDefaultFont(context),),
                      Icon(shadcn.LucideIcons.arrowUpDown, size: kWidgetFontSize, color: shadcn.Theme.of(context).colorScheme.cardForeground,)
                    ],
                  ), numeric: key=='Amount'? true : false,
                    onSort:  (columnIndex, ascending) => _sort((invoices) => invoices[key], columnIndex, _isAscending),
                  );
                }).toList(),
                source: InvoiceDataSource(ref.watch(invoiceProvider).invoices!, context),
                rowsPerPage: ref.watch(invoiceProvider).invoices!.length > 19 ? 20 : invoices.length,
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
      ref.watch(invoiceProvider).invoices!.sort((a, b) {
        final aValue = getField(a);
        final bValue = getField(b);
        return ascending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
      });
    });
  }
}
