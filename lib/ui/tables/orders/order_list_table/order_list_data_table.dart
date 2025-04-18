import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oursales/main.dart';
import '../../../../util/functions/capitalize_first_character.dart';
import '../../../../util/widget_constants.dart';
import 'data_table_source.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' as shadcn;

class OrderListDataTable extends ConsumerStatefulWidget {
  const OrderListDataTable({super.key});

  @override
  ConsumerState<OrderListDataTable> createState() => _OrderListDataTableState();
}

class _OrderListDataTableState extends ConsumerState<OrderListDataTable> {
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
                showCheckboxColumn: false,
                headingRowColor:   WidgetStateColor.resolveWith((states) => shadcn.Theme.of(context).colorScheme.background),
                columns: ref.watch(orderProvider).orders!.first.keys.map((key) {
                  return DataColumn(
                    label: Row(
                      spacing: 10,
                      children: [
                        Text(capitalizeFirstLetter(key), style: kBoldedDefaultFont(context),),
                        Icon(
                          shadcn.LucideIcons.arrowUpDown,
                          size: kWidgetFontSize,
                        )
                      ],
                    ),
                    numeric: key == 'Amount' ? true : false,
                    onSort: (columnIndex, ascending) => _sort((orders) => orders[key], columnIndex, _isAscending),
                  );
                }).toList(),
                source: OrderDataSource(ref.watch(orderProvider).orders!, context),
                rowsPerPage: ref.watch(orderProvider).orders!.length > 19 ? 20 : ref.watch(orderProvider).orders!.length,
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
      ref.watch(orderProvider).orders!.sort((a, b) {
        final aValue = getField(a);
        final bValue = getField(b);
        return ascending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
      });
    });
  }
}
