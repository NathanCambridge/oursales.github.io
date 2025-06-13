import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../util/widget_constants.dart';

class InvoiceDetailsDataSource extends DataTableSource {
  late final List<Map<String, dynamic>> selectedInvoice;
  late BuildContext context;

  InvoiceDetailsDataSource({required this.selectedInvoice, required this.context});

  @override
  DataRow getRow(int index) {
    final invoiceDetails = selectedInvoice[index];
    final colorTheme = ShadTheme.of(context).colorScheme;
    final textTheme = ShadTheme.of(context).textTheme;

    return DataRow(
        color: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (index % 2 == 0) {
              return states.contains(WidgetState.hovered) ? colorTheme.destructive : colorTheme.card.withOpacity(0.8); // Even rows
            } else {
              return states.contains(WidgetState.hovered) ? colorTheme.destructive : colorTheme.secondary.withOpacity(0.8); // Odd rows
            } // Default color for odd rows

          },
        ),
        cells: invoiceDetails.values.map((value) {
          return DataCell(
            value == "invoiced"? Icon(LucideIcons.truck, weight: 0.1, color: Colors.blueAccent,) : value == "delivered"? Icon(LucideIcons.check, color: Colors.green,) : Text(
              value.toString(),
              style: textTheme.small.copyWith(
                  fontSize: kWidgetFontSize, color: colorTheme.foreground),
            ),
          );
        }).toList(),
        onSelectChanged: (change) {
          context.go('/invoice/invoice_details');
        });
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => selectedInvoice.length;

  @override
  int get selectedRowCount => 0;
}
