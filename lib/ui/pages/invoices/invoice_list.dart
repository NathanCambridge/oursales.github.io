import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:oursales/main.dart';
import 'package:oursales/ui/components/sidemenu/shad_side_menu.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' as shadcn;

import '../../../util/widget_constants.dart';
import '../../components/sidemenu/sidemenu.dart';
import '../../tables/invoice/invoice_list_table/invoice_list_data_table.dart';

class InvoiceListPage extends ConsumerStatefulWidget {
  const InvoiceListPage({super.key});

  @override
  ConsumerState<InvoiceListPage> createState() => _InvoiceListPageState();
}

class _InvoiceListPageState extends ConsumerState<InvoiceListPage> {
  shadcn.DateTimeRange? _value;
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredInvoices = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.watch(invoiceProvider).getLatestInvoices(invoices);
    });
    // Show all by default
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: shadcn.Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20,
        ),
        child: Row(
          children: [
            ExpandedSideBar(),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 15,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        shadcn.PrimaryButton(
                          onPressed: () {},
                          child: const Text('Create Invoice').xSmall(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 25,
                          children: [
                            shadcn.DefaultTextStyle(
                              style: kDefaultFont(context),
                              child: shadcn.DateRangePicker(
                                value: _value,
                                mode: shadcn.PromptMode.popover,
                                onChanged: (value) {
                                  setState(() {
                                    _value = value;
                                  });
                                },
                              ),
                            ),
                            const shadcn.Gap(16),
                            shadcn.OutlineButton(
                              onPressed: () {},
                              child: Text(
                                'Fetch Data',
                              ).xSmall(),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            shadcn.Text(
                              'TZS 203,155,168.65',
                              style: kHeaderDefaultFont(context),
                            ).small().bold(),
                          ],
                        ),
                        Row(
                          children: [
                            ConstrainedBox(
                                constraints: const BoxConstraints(maxWidth: 250),
                                child: shadcn.TextField(
                                  controller: searchController,
                                  onChanged: (value) {
                                      filteredInvoices = updateSearch(value);
                                      ref.watch(invoiceProvider).getLatestInvoices(filteredInvoices);
                                  },
                                  placeholder: shadcn.Text('Search').xSmall(),
                                  trailing: Icon(
                                    shadcn.LucideIcons.search,
                                    size: 15,
                                  ),
                                )),
                            SizedBox(width: 10)
                          ],
                        )
                      ],
                    ),
                    if (ref.watch(invoiceProvider).invoices!.isEmpty)
                      Padding(
                        padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * .25),
                        child: Center(
                            child: Text(
                          'No invoice Found',
                          style: kHeaderDefaultFont(context),
                        )),
                      )
                    else
                      // The paginated data table to display invoices
                      InvoiceListDataTable(
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> updateSearch(String query) {
    List<Map<String, dynamic>> newList = [];

    setState(() {
      searchQuery = query.toLowerCase().replaceAll(RegExp(r'\s+'), '');

      newList = invoices.where((invoice) {
        return invoice.values.any((value) {
          final stringValue = value.toString().toLowerCase().replaceAll(RegExp(r'\s+'), '');
          return stringValue.contains(searchQuery);
        });
      }).toList();
    });

    return newList;
  }
}

final List<Map<String, dynamic>> invoices = [
  {
    'date': '02.01.2025',
    'invoice': 'LS/1001/2025',
    'CustomerCode': 'C10023',
    'CustomerName': 'Alice Johnson',
    'Salesman': 'John Mwangi',
    'Amount': '1,200,500',
    'vehicle': 'T 123 ABC',
    'status': 'invoiced',
  },
  {
    'date': '05.01.2025',
    'invoice': 'LS/1002/2025',
    'CustomerCode': 'C10045',
    'CustomerName': 'Michael Brown',
    'Salesman': 'Sarah Kilonzo',
    'Amount': '2,050,700',
    'vehicle': 'T 234 BCD',
    'status': 'on delivery',
  },
  {
    'date': '10.01.2025',
    'invoice': 'LS/1003/2025',
    'CustomerCode': 'C10123',
    'CustomerName': 'Emma Wilson',
    'Salesman': 'David Kimaro',
    'Amount': '800,400',
    'vehicle': 'T 345 CDE',
    'status': 'supplied',
  },
  {
    'date': '15.01.2025',
    'invoice': 'LS/1004/2025',
    'CustomerCode': 'C10234',
    'CustomerName': 'James Anderson',
    'Salesman': 'Paul Sanga',
    'Amount': '3,500,000',
    'vehicle': 'T 456 DEF',
    'status': 'on delivery',
  },
  {
    'date': '20.01.2025',
    'invoice': 'LS/1005/2025',
    'CustomerCode': 'C10345',
    'CustomerName': 'Olivia Thomas',
    'Salesman': 'Jessica Mwalimu',
    'Amount': '950,600',
    'vehicle': 'T 567 EFG',
    'status': 'invoiced',
  },
  {
    'date': '25.01.2025',
    'invoice': 'LS/1006/2025',
    'CustomerCode': 'C10456',
    'CustomerName': 'William Martinez',
    'Salesman': 'Daniel Mushi',
    'Amount': '1,750,900',
    'vehicle': 'T 678 FGH',
    'status': 'invoiced',
  },
  {
    'date': '30.01.2025',
    'invoice': 'LS/1007/2025',
    'CustomerCode': 'C10567',
    'CustomerName': 'Sophia Robinson',
    'Salesman': 'Elizabeth Ngugi',
    'Amount': '2,870,500',
    'vehicle': 'T 789 GHI',
    'status': 'invoiced',
  },
  {
    'date': '02.02.2025',
    'invoice': 'LS/1008/2025',
    'CustomerCode': 'C10678',
    'CustomerName': 'Benjamin Clark',
    'Salesman': 'Francis Mwenda',
    'Amount': '1,630,300',
    'vehicle': 'T 890 HIJ',
    'status': 'supplied',
  },
  {
    'date': '07.02.2025',
    'invoice': 'LS/1009/2025',
    'CustomerCode': 'C10789',
    'CustomerName': 'Charlotte Lewis',
    'Salesman': 'John Omari',
    'Amount': '780,200',
    'vehicle': 'T 901 IJK',
    'status': 'invoiced',
  },
  {
    'date': '12.02.2025',
    'invoice': 'LS/1010/2025',
    'CustomerCode': 'C10890',
    'CustomerName': 'Henry Walker',
    'Salesman': 'Angela Kiptoo',
    'Amount': '3,210,900',
    'vehicle': 'T 012 JKL',
    'status': 'invoiced',
  },
  {
    'date': '17.02.2025',
    'invoice': 'LS/1011/2025',
    'CustomerCode': 'C10901',
    'CustomerName': 'Amelia Hall',
    'Salesman': 'Sarah Kilonzo',
    'Amount': '1,500,000',
    'vehicle': 'T 123 KLM',
    'status': 'on delivery',
  },
  {
    'date': '22.02.2025',
    'invoice': 'LS/1012/2025',
    'CustomerCode': 'C11012',
    'CustomerName': 'Lucas Allen',
    'Salesman': 'David Kimaro',
    'Amount': '2,900,750',
    'vehicle': 'T 234 LMN',
    'status': 'on delivery',
  },
  {
    'date': '27.02.2025',
    'invoice': 'LS/1013/2025',
    'CustomerCode': 'C11123',
    'CustomerName': 'Mia Young',
    'Salesman': 'Jessica Mwalimu',
    'Amount': '1,120,400',
    'vehicle': 'T 345 MNO',
    'status': 'invoiced',
  },
  {
    'date': '04.03.2025',
    'invoice': 'LS/1014/2025',
    'CustomerCode': 'C11234',
    'CustomerName': 'Ethan King',
    'Salesman': 'Paul Sanga',
    'Amount': '3,650,800',
    'vehicle': 'T 456 NOP',
    'status': 'invoiced',
  },
  {
    'date': '10.03.2025',
    'invoice': 'LS/1015/2025',
    'CustomerCode': 'C11345',
    'CustomerName': 'Harper Scott',
    'Salesman': 'Francis Mwenda',
    'Amount': '850,900',
    'vehicle': 'T 567 OPQ',
    'status': 'supplied',
  },
  {
    'date': '15.03.2025',
    'invoice': 'LS/1016/2025',
    'CustomerCode': 'C11456',
    'CustomerName': 'Alexander Green',
    'Salesman': 'John Omari',
    'Amount': '2,450,200',
    'vehicle': 'T 678 PQR',
    'status': 'invoiced',
  },
  {
    'date': '20.03.2025',
    'invoice': 'LS/1017/2025',
    'CustomerCode': 'C11567',
    'CustomerName': 'Ava Baker',
    'Salesman': 'Elizabeth Ngugi',
    'Amount': '1,780,500',
    'vehicle': 'T 789 QRS',
    'status': 'invoiced',
  },
  {
    'date': '25.03.2025',
    'invoice': 'LS/1018/2025',
    'CustomerCode': 'C11678',
    'CustomerName': 'Daniel Nelson',
    'Salesman': 'Angela Kiptoo',
    'Amount': '2,950,600',
    'vehicle': 'T 890 RST',
    'status': 'invoiced',
  },
  {
    'date': '30.03.2025',
    'invoice': 'LS/1019/2025',
    'CustomerCode': 'C11789',
    'CustomerName': 'Ella Adams',
    'Salesman': 'Daniel Mushi',
    'Amount': '3,500,900',
    'vehicle': 'T 901 STU',
    'status': 'invoiced',
  },
  {
    'date': '05.04.2025',
    'invoice': 'LS/1020/2025',
    'CustomerCode': 'C11890',
    'CustomerName': 'Mason White',
    'Salesman': 'Paul Sanga',
    'Amount': '1,300,700',
    'vehicle': 'T 012 TUV',
    'status': 'supplied',
  },
  {
    'date': '05.04.2025',
    'invoice': 'LS/1020/2025',
    'CustomerCode': 'C11890',
    'CustomerName': 'Mason White',
    'Salesman': 'Paul Sanga',
    'Amount': '1,300,700',
    'vehicle': 'T 012 TUV',
    'status': 'supplied',
  },
  {
    'date': '05.04.2025',
    'invoice': 'LS/1020/2025',
    'CustomerCode': 'C11890',
    'CustomerName': 'Mason White',
    'Salesman': 'Paul Sanga',
    'Amount': '1,300,700',
    'vehicle': 'T 012 TUV',
    'status': 'supplied',
  },
];
