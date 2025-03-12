import 'package:flutter/material.dart';
import 'package:oursales/util/functions/capitalize_first_character.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class NewOrderDataTable extends StatelessWidget {
  const NewOrderDataTable({super.key, required this.orderItems});

  final List<Map<String, dynamic>> orderItems;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;
    final textTheme = ShadTheme.of(context).textTheme;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: DataTable(
          decoration: BoxDecoration(color: colorScheme.secondary),
          columns: orderItems.first.keys.map((key) {
            return DataColumn(
              label: Text(capitalizeFirstLetter(key),style: textTheme.small.copyWith(fontWeight: FontWeight.bold),),
            );
          }).toList(),
          rows: orderItems.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, dynamic> invoice = entry.value;

            return DataRow(
              onSelectChanged: (value) {},
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
                return DataCell(cell.key == 'price' || cell.key == 'discount' || cell.key == 'qty'
                    ? ShadInput(
                        decoration: ShadDecoration(
                            border: ShadBorder.none,
                            focusedBorder: ShadBorder(
                                top: ShadBorderSide(width: 0.02),
                                left: ShadBorderSide(width: 0.02),
                                right: ShadBorderSide(width: 0.02),
                                bottom: ShadBorderSide(width: 0.02))),
                        initialValue: cell.value.toString())
                    : Text(
                        cell.value.toString(),
                      ));
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }
}
