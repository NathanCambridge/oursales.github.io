import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class OrderDetailsDataTable extends StatelessWidget {
  const OrderDetailsDataTable({super.key, required this.selectedOrder});

  final List<Map<String, dynamic>> selectedOrder;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DataTable(
        showCheckboxColumn: false ,
        columns: selectedOrder.first.keys.map((key) {
          return DataColumn(
            label: Text(key),
            numeric: key == 'numeric',
          );
        }).toList(),
        rows: selectedOrder.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> invoice = entry.value;

          return DataRow(
            onSelectChanged: (value){

            },
            color: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                return index % 2 == 0
                    ? states.contains(WidgetState.hovered)
                    ? colorScheme.destructive
                    : colorScheme.card.withOpacity(0.8) // Even row color
                    : states.contains(WidgetState.hovered)
                    ? colorScheme.destructive
                    : colorScheme.secondary.withOpacity(0.8); // Odd row color
              },
            ),
            cells: invoice.entries.map((cell) {
              return DataCell(Text(cell.value.toString()));
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
