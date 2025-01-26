import 'package:flutter/cupertino.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class InvoiceProducts extends StatefulWidget {
  const InvoiceProducts({super.key, required this.products});

  final List products;

  @override
  State<InvoiceProducts> createState() => _InvoiceProductsState();
}

class _InvoiceProductsState extends State<InvoiceProducts> {
  var searchValue = '';

  Map<String, String> get filteredProducts {
    return {
      for (final product in widget.products)
        if (product['name']!.toLowerCase().contains(searchValue.toLowerCase())) product['name']!: product['name']!
    };
  }

  @override
  Widget build(BuildContext context) {
    return ShadSelect<String>.withSearch(
      minWidth: MediaQuery.sizeOf(context).width * 0.3,
      placeholder: const Text('Select Product...'),
      onSearchChanged: (value) => setState(() => searchValue = value),
      searchPlaceholder: const Text('Search Product'),
      options: [
        if (filteredProducts.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text('No product found'),
          ),
        ...filteredProducts.entries.map(
          (customer) {
            return ShadOption(
              value: customer.key,
              child: Text(customer.value),
            );
          },
        )
      ],
      selectedOptionBuilder: (context, value) => Text(widget.products.firstWhere((c) => c['name'] == value)['name']!),
    );
  }
}
