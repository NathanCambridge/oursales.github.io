import 'package:flutter/cupertino.dart';
import 'package:shadcn_ui/shadcn_ui.dart';


class InvoiceCustomerList extends StatefulWidget {
  const InvoiceCustomerList({super.key, required  this.customers});



  final List customers;

  @override
  State<InvoiceCustomerList> createState() => _InvoiceCustomerListState();
}

class _InvoiceCustomerListState extends State<InvoiceCustomerList> {
  var searchValue = '';

  Map<String, String> get filteredCustomers {
    return {
      for (final customer in widget.customers)
        if (customer['name']!.toLowerCase().contains(searchValue.toLowerCase()))
          customer['name']!: customer['name']!
    };
  }

  @override
  Widget build(BuildContext context) {
    return ShadSelect<String>.withSearch(
      minWidth: 180,
      maxWidth: 300,
      placeholder: const Text('Select Customer...'),
      onSearchChanged: (value) => setState(() => searchValue = value),
      searchPlaceholder: const Text('Search Customer'),
      options: [
        if (filteredCustomers.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text('No customer found'),
          ),
        ...filteredCustomers.entries.map(
              (customer) {
            return ShadOption(
              value: customer.key,
              child: Text(customer.value),
            );
          },
        )
      ],
      selectedOptionBuilder: (context, value) => Text(widget.customers.firstWhere((c) => c['name'] == value)['name']!),
    );
  }
}