import 'package:flutter/cupertino.dart';
import 'package:oursales/util/functions/capitalize_first_character.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../util/widget_constants.dart';

final warehouses = [
  {'name': 'T 102 ABC'},
  {'name': 'T 110 CBA'},
  {'name': 'T 605 EHG'},
];

class WarehouseListComboBox extends StatelessWidget {
  const WarehouseListComboBox({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final textTheme = ShadTheme.of(context).textTheme;
    return ShadSelect<String>.multiple(
      minWidth: 340,
      onChanged: print,
      allowDeselection: true,
      closeOnSelect: false,
      placeholder: const Text('Select warehouse'),
      options: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
          child: Text(
            'Warehouses',
            style: theme.textTheme.large,
            textAlign: TextAlign.start,
          ),
        ),
        ...warehouses.map(
              (warehouse) => ShadOption(
            value: warehouse['name']!, // Extracting name properly
            child: Text(warehouse['name']!, style:textTheme.small.copyWith(fontSize: kWidgetFontSize),), // Displaying name correctly
          ),
        ),
      ],
      selectedOptionsBuilder: (context, values) => Text(
        values.map((v) => capitalizeFirstLetter(v)).join(', '),
      ),
    );
  }
}
