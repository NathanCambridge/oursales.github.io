import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oursales/ui/tables/invoice_list_table/invoice_list_data_table.dart';
import 'package:oursales/util/widget_constants.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../components/sidemenu/sidemenu.dart';
import '../../tables/invoice_list_table/data_table_source.dart';

class InvoiceListPage extends StatefulWidget {
  const InvoiceListPage({super.key});

  @override
  State<InvoiceListPage> createState() => _InvoiceListPageState();
}

class _InvoiceListPageState extends State<InvoiceListPage> {
  final popoverController = ShadPopoverController();
  final menuController = ShadPopoverController();


  @override
  void dispose() {
    popoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = ShadTheme
        .of(context)
        .textTheme;
    final colorTheme = ShadTheme
        .of(context)
        .colorScheme;
    final screenWidth = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          right: 20,
        ),
        child: Row(
          children: [
            SideMenu(),
            Expanded(
              flex: 6,
              child: Column(
                spacing: 15,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ShadButton(
                        child: Text(
                          'New Invoice',
                          style: textTheme.small.copyWith(
                              fontSize: kWidgetFontSize,
                              color: colorTheme.primaryForeground),
                        ),
                        onPressed: (){
                          context.go('/invoice/create_new_invoice');
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
                            placeholder: Text('Start - End Date',
                                style: textTheme.small
                                    .copyWith(fontSize: kWidgetFontSize)),
                            closeOnSelection: true,
                            hideWeekdayNames: true,
                          ),
                          ShadButton.outline(
                            child: Text(
                              'Fetch Data',
                              style: textTheme.small
                                  .copyWith(fontSize: kWidgetFontSize),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'TZS 203,155,168.65',
                            style: textTheme.small
                                .copyWith(fontWeight: FontWeight.bold),
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
                  InvoiceListDataTable(invoices: invoices,),
                ],
              ),
            )
          ],
        ),
      ),
    );
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
    'status': 'delivered',
  },
  {
    'date': '10.01.2025',
    'invoice': 'LS/1003/2025',
    'CustomerCode': 'C10123',
    'CustomerName': 'Emma Wilson',
    'Salesman': 'David Kimaro',
    'Amount': '800,400',
    'vehicle': 'T 345 CDE',
    'status': 'pending',
  },
  {
    'date': '15.01.2025',
    'invoice': 'LS/1004/2025',
    'CustomerCode': 'C10234',
    'CustomerName': 'James Anderson',
    'Salesman': 'Paul Sanga',
    'Amount': '3,500,000',
    'vehicle': 'T 456 DEF',
    'status': 'delivered',
  },
  {
    'date': '20.01.2025',
    'invoice': 'LS/1005/2025',
    'CustomerCode': 'C10345',
    'CustomerName': 'Olivia Thomas',
    'Salesman': 'Jessica Mwalimu',
    'Amount': '950,600',
    'vehicle': 'T 567 EFG',
    'status': 'paid',
  },
  {
    'date': '25.01.2025',
    'invoice': 'LS/1006/2025',
    'CustomerCode': 'C10456',
    'CustomerName': 'William Martinez',
    'Salesman': 'Daniel Mushi',
    'Amount': '1,750,900',
    'vehicle': 'T 678 FGH',
    'status': 'pending',
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
    'status': 'paid',
  },
  {
    'date': '07.02.2025',
    'invoice': 'LS/1009/2025',
    'CustomerCode': 'C10789',
    'CustomerName': 'Charlotte Lewis',
    'Salesman': 'John Omari',
    'Amount': '780,200',
    'vehicle': 'T 901 IJK',
    'status': 'pending',
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
    'status': 'paid',
  },
  {
    'date': '22.02.2025',
    'invoice': 'LS/1012/2025',
    'CustomerCode': 'C11012',
    'CustomerName': 'Lucas Allen',
    'Salesman': 'David Kimaro',
    'Amount': '2,900,750',
    'vehicle': 'T 234 LMN',
    'status': 'pending',
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
    'status': 'paid',
  },
  {
    'date': '10.03.2025',
    'invoice': 'LS/1015/2025',
    'CustomerCode': 'C11345',
    'CustomerName': 'Harper Scott',
    'Salesman': 'Francis Mwenda',
    'Amount': '850,900',
    'vehicle': 'T 567 OPQ',
    'status': 'pending',
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
    'status': 'paid',
  },
  {
    'date': '25.03.2025',
    'invoice': 'LS/1018/2025',
    'CustomerCode': 'C11678',
    'CustomerName': 'Daniel Nelson',
    'Salesman': 'Angela Kiptoo',
    'Amount': '2,950,600',
    'vehicle': 'T 890 RST',
    'status': 'pending',
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
    'status': 'paid',
  },
];


