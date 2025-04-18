import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../util/widget_constants.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' as shadcn;

class OrderDataSource extends DataTableSource {
  late final List<Map<String, dynamic>> orders;
  late BuildContext context;

  OrderDataSource(this.orders, this.context);

  @override
  DataRow getRow(int index) {
    final order = orders[index];
    final colorTheme = shadcn.Theme.of(context).colorScheme;

    return DataRow(
        color: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (index % 2 == 0) {
              return states.contains(WidgetState.hovered) ? colorTheme.destructive : colorTheme.background.withOpacity(0.8); // Even rows
            } else {
              return states.contains(WidgetState.hovered) ? colorTheme.destructive : colorTheme.secondary.withOpacity(0.8); // Odd rows
            } // Default color for odd rows

          },
        ),
        cells: order.values.map((value) {
          return DataCell(
            value == "invoiced"? Icon(shadcn.LucideIcons.truck, weight: 0.1, color: Colors.blueAccent,) : value == "delivered"? Icon(shadcn.LucideIcons.check, color: Colors.green,) : Text(
              value.toString(),
              style: kDefaultFont(context)),
          );
        }).toList(),
        onSelectChanged: (change) {
          context.go('/order/order_details');
        });
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => orders.length;

  @override
  int get selectedRowCount => 0;
}
