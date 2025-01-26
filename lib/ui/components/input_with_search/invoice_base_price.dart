import 'package:flutter/cupertino.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class InvoiceBasePrice extends StatefulWidget {
  const InvoiceBasePrice({super.key, required this.basePrices});

  final List basePrices;

  @override
  State<InvoiceBasePrice> createState() => _InvoiceBasePriceState();
}

class _InvoiceBasePriceState extends State<InvoiceBasePrice> {
  var searchValue = '';

  Map<String, String> get filteredBasePrices {
    return {
      for (final salesPerson in widget.basePrices)
        if (salesPerson['name']!.toLowerCase().contains(searchValue.toLowerCase())) salesPerson['name']!: salesPerson['name']!
    };
  }

  @override
  Widget build(BuildContext context) {
    return ShadSelect<String>.withSearch(
      minWidth: 180,
      maxWidth: 300,
      placeholder: const Text('Select Base price...'),
      onSearchChanged: (value) => setState(() => searchValue = value),
      searchPlaceholder: const Text('Search Base Price'),
      options: [
        if (filteredBasePrices.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text('No Base Price found'),
          ),
        ...filteredBasePrices.entries.map(
          (customer) {
            return ShadOption(
              value: customer.key,
              child: Text(customer.value),
            );
          },
        )
      ],
      selectedOptionBuilder: (context, value) => Text(widget.basePrices.firstWhere((c) => c['name'] == value)['name']!),
    );
  }
}
