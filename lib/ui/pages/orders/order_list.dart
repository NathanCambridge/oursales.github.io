import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oursales/util/widget_constants.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../components/sidemenu/sidemenu.dart';
import '../../tables/orders/order_list_table/order_list_data_table.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  final popoverController = ShadPopoverController();
  final menuController = ShadPopoverController();

  @override
  void dispose() {
    popoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = ShadTheme.of(context).textTheme;
    final colorTheme = ShadTheme.of(context).colorScheme;
    final screenWidth = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20,
        ),
        child: Row(
          children: [
            SideMenu(),
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
                        ShadButton(
                          child: Text(
                            'New Order',
                            style: textTheme.small.copyWith(fontSize: kWidgetFontSize, color: colorTheme.primaryForeground),
                          ),
                          onPressed: () {
                            context.go('/order/create_new_order');
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 15,
                          children: [
                            ShadDatePicker.range(
                              placeholder: Text('Start - End Date', style: textTheme.small.copyWith(fontSize: kWidgetFontSize)),
                              closeOnSelection: true,
                              hideWeekdayNames: true,
                            ),
                            ShadButton.outline(
                              child: Text(
                                'Fetch Orders',
                                style: textTheme.small.copyWith(fontSize: kWidgetFontSize),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'TZS 203,155,168.65',
                              style: textTheme.small.copyWith(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 250),
                              child: const ShadInput(
                                placeholder: Text('Search'),
                                prefix: Icon(
                                  LucideIcons.search,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    OrderListDataTable(
                      orders: orders,
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
}

final List<Map<String, dynamic>> orders = [
  {
    'order_date': '02.01.2025',
    'order_number': 'LS/1001/2025',
    'CustomerCode': 'C10023',
    'CustomerName': 'Alice Johnson',
    'order_creator': 'John Mwangi',
    'Amount': '1,200,500',
    'status': 'created',
  },
  {
    'order_date': '02.01.2025',
    'order_number': 'LS/1001/2025',
    'CustomerCode': 'C10023',
    'CustomerName': 'Alice Johnson',
    'order_creator': 'John Mwangi',
    'Amount': '1,200,500',
    'status': 'created',
  },
  {
    'order_date': '02.01.2025',
    'order_number': 'LS/1001/2025',
    'CustomerCode': 'C10023',
    'CustomerName': 'Alice Johnson',
    'order_creator': 'John Mwangi',
    'Amount': '1,200,500',
    'status': 'created',
  },
  {
    'order_date': '02.01.2025',
    'order_number': 'LS/1001/2025',
    'CustomerCode': 'C10023',
    'CustomerName': 'Alice Johnson',
    'order_creator': 'John Mwangi',
    'Amount': '1,200,500',
    'status': 'created',
  },
  {
    'order_date': '02.01.2025',
    'order_number': 'LS/1001/2025',
    'CustomerCode': 'C10023',
    'CustomerName': 'Alice Johnson',
    'order_creator': 'John Mwangi',
    'Amount': '1,200,500',
    'status': 'created',
  },
  {
    'order_date': '02.01.2025',
    'order_number': 'LS/1001/2025',
    'CustomerCode': 'C10023',
    'CustomerName': 'Alice Johnson',
    'order_creator': 'John Mwangi',
    'Amount': '1,200,500',
    'status': 'created',
  },
  {
    'order_date': '02.01.2025',
    'order_number': 'LS/1001/2025',
    'CustomerCode': 'C10023',
    'CustomerName': 'Alice Johnson',
    'order_creator': 'John Mwangi',
    'Amount': '1,200,500',
    'status': 'created',
  },
  {
    'order_date': '02.01.2025',
    'order_number': 'LS/1001/2025',
    'CustomerCode': 'C10023',
    'CustomerName': 'Alice Johnson',
    'order_creator': 'John Mwangi',
    'Amount': '1,200,500',
    'status': 'created',
  },
  {
    'order_date': '02.01.2025',
    'order_number': 'LS/1001/2025',
    'CustomerCode': 'C10023',
    'CustomerName': 'Alice Johnson',
    'order_creator': 'John Mwangi',
    'Amount': '1,200,500',
    'status': 'created',
  },
  {
    'order_date': '02.01.2025',
    'order_number': 'LS/1001/2025',
    'CustomerCode': 'C10023',
    'CustomerName': 'Alice Johnson',
    'order_creator': 'John Mwangi',
    'Amount': '1,200,500',
    'status': 'created',
  },
  {
    'order_date': '02.01.2025',
    'order_number': 'LS/1001/2025',
    'CustomerCode': 'C10023',
    'CustomerName': 'Alice Johnson',
    'order_creator': 'John Mwangi',
    'Amount': '1,200,500',
    'status': 'created',
  },
  {
    'order_date': '02.01.2025',
    'order_number': 'LS/1001/2025',
    'CustomerCode': 'C10023',
    'CustomerName': 'Alice Johnson',
    'order_creator': 'John Mwangi',
    'Amount': '1,200,500',
    'status': 'created',
  },
  {
    'order_date': '02.01.2025',
    'order_number': 'LS/1001/2025',
    'CustomerCode': 'C10023',
    'CustomerName': 'Alice Johnson',
    'order_creator': 'John Mwangi',
    'Amount': '1,200,500',
    'status': 'created',
  },
  {
    'order_date': '02.01.2025',
    'order_number': 'LS/1001/2025',
    'CustomerCode': 'C10023',
    'CustomerName': 'Alice Johnson',
    'order_creator': 'John Mwangi',
    'Amount': '1,200,500',
    'status': 'created',
  },
  {
    'order_date': '02.01.2025',
    'order_number': 'LS/1001/2025',
    'CustomerCode': 'C10023',
    'CustomerName': 'Alice Johnson',
    'order_creator': 'John Mwangi',
    'Amount': '1,200,500',
    'status': 'created',
  },
  {
    'order_date': '02.01.2025',
    'order_number': 'LS/1001/2025',
    'CustomerCode': 'C10023',
    'CustomerName': 'Alice Johnson',
    'order_creator': 'John Mwangi',
    'Amount': '1,200,500',
    'status': 'created',
  },
  {
    'order_date': '02.01.2025',
    'order_number': 'LS/1001/2025',
    'CustomerCode': 'C10023',
    'CustomerName': 'Alice Johnson',
    'order_creator': 'John Mwangi',
    'Amount': '1,200,500',
    'status': 'created',
  },
  {
    'order_date': '02.01.2025',
    'order_number': 'LS/1001/2025',
    'CustomerCode': 'C10023',
    'CustomerName': 'Alice Johnson',
    'order_creator': 'John Mwangi',
    'Amount': '1,200,500',
    'status': 'created',
  },
  {
    'order_date': '02.01.2025',
    'order_number': 'LS/1001/2025',
    'CustomerCode': 'C10023',
    'CustomerName': 'Alice Johnson',
    'order_creator': 'John Mwangi',
    'Amount': '1,200,500',
    'status': 'created',
  },
  {
    'order_date': '02.01.2025',
    'order_number': 'LS/1001/2025',
    'CustomerCode': 'C10023',
    'CustomerName': 'Alice Johnson',
    'order_creator': 'John Mwangi',
    'Amount': '1,200,500',
    'status': 'created',
  },
];
