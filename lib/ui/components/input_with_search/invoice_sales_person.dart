import 'package:flutter/cupertino.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class InvoiceSalesPerson extends StatefulWidget {
  const InvoiceSalesPerson({super.key, required this.salesPersons});

  final List salesPersons;

  @override
  State<InvoiceSalesPerson> createState() => _InvoiceSalesPersonState();
}

class _InvoiceSalesPersonState extends State<InvoiceSalesPerson> {
  var searchValue = '';

  Map<String, String> get filteredSalesPersons {
    return {
      for (final salesPerson in widget.salesPersons)
        if (salesPerson['name']!.toLowerCase().contains(searchValue.toLowerCase())) salesPerson['name']!: salesPerson['name']!
    };
  }

  @override
  Widget build(BuildContext context) {
    return ShadSelect<String>.withSearch(
      minWidth: 180,
      maxWidth: 300,
      placeholder: const Text('Select Sales Person...'),
      onSearchChanged: (value) => setState(() => searchValue = value),
      searchPlaceholder: const Text('Search Sales Person'),
      options: [
        if (filteredSalesPersons.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text('No Sales person found'),
          ),
        ...filteredSalesPersons.entries.map(
          (customer) {
            return ShadOption(
              value: customer.key,
              child: Text(customer.value),
            );
          },
        )
      ],
      selectedOptionBuilder: (context, value) => Text(widget.salesPersons.firstWhere((c) => c['name'] == value)['name']!),
    );
  }
}
