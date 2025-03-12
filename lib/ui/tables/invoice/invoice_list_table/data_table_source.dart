import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../util/widget_constants.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' as shadcn;

class InvoiceDataSource extends DataTableSource {
  late final List<Map<String, dynamic>> invoices;
  late BuildContext context;

  InvoiceDataSource(this.invoices, this.context);

  @override
  DataRow getRow(int index) {
    final invoice = invoices[index];
    final colorTheme = shadcn.Theme.of(context).colorScheme;

    return DataRow(
        color: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (index % 2 == 0) {
              return states.contains(WidgetState.hovered)
                  ? colorTheme.destructive
                  : colorTheme.background.withOpacity(0.9); // Even rows
            } else {
              return states.contains(WidgetState.hovered) ? colorTheme.destructive : colorTheme.card.withOpacity(0.9); // Odd rows
            } // Default color for odd rows
          },
        ),
        cells: invoice.values.map((value) {
          return DataCell(
            value == "invoiced"
                ? Icon(
                    shadcn.LucideIcons.checkCheck,
                    color: Colors.purpleAccent,
                  )
                : value == "on delivery"
                    ? Icon(
                        shadcn.LucideIcons.truck,
                        color: Colors.orange,
                      )
                    : value == "supplied"
                        ? Icon(
                            shadcn.LucideIcons.clipboardCheck,
                            color: Colors.greenAccent,
                          )
                        : Text(
                            value.toString(),
                            style: TextStyle(color: colorTheme.cardForeground, fontSize: kWidgetFontSize),
                          ).small(),
          );
        }).toList(),
        onSelectChanged: (change) {
          context.go('/invoice/invoice_details');
        });
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => invoices.length;

  @override
  int get selectedRowCount => 0;
}
