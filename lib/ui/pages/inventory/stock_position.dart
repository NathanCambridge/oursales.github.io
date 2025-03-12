import 'package:flutter/material.dart';
import 'package:oursales/ui/components/combobox/combo_box.dart';
import 'package:oursales/ui/components/input_with_search/customer_input_with_search.dart';
import 'package:oursales/ui/components/input_with_search/invoice_base_price.dart';
import 'package:oursales/ui/components/input_with_search/invoice_sales_person.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../util/widget_constants.dart';
import '../../components/sidemenu/sidemenu.dart';

class StockPosition extends StatefulWidget {
  const StockPosition({super.key});

  @override
  State<StockPosition> createState() => _StockPositionState();
}

class _StockPositionState extends State<StockPosition> {
  @override
  Widget build(BuildContext context) {
    final textTheme = ShadTheme.of(context).textTheme;
    final colorScheme = ShadTheme.of(context).colorScheme;
    return Scaffold(
      body: Row(
        children: [
          SideMenu(),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 15,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: colorScheme.secondary,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text('Stock Position', style: textTheme.h1.copyWith(fontSize: 18))
                      ],
                    ),
                  ),
                  Row(
                    spacing: 15,
                    children: [
                      Row(
                        spacing: 15,
                        children: [
                          ShadDatePicker.range(
                            placeholder: Text('Start - End Date', style: textTheme.small.copyWith(fontSize: kWidgetFontSize)),
                            closeOnSelection: true,
                            hideWeekdayNames: true,
                          ),
                          WarehouseListComboBox(),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

const customers = [
  {'name': 'John Kilambo'},
  {'name': 'Philip Jobiso'},
  {'name': 'John Bishop'},
  {'name': 'Faustini Kilambo'},
];

const salesPersons = [
  {'name': 'Chacha Marwa'},
  {'name': 'Massawe Kichwa'},
  {'name': 'Mgosi Wandima'},
  {'name': 'Lameck Kishoka'},
];

const basePrices = [
  {'name': 'Retail'},
  {'name': 'Wholesale'},
  {'name': 'Local Modern Trade'},
  {'name': 'Horeca'},
];

const products = [
  {'name': 'Veve'},
  {'name': 'Drinking Chocolate 12X450G'},
  {'name': 'DYML ORIG CHOCOLATE 12X80G'},
];

const List<Map<String, dynamic>> invoiceItems = [
  {
    'code': 'P0023',
    'product': 'Veve',
    'uom': 'ctn',
    'qty': 10,
    'free ctn': '',
    'free pcs': '',
    'price': 20000,
    'discount': 0,
    'tax%': 18,
    'total': 12000,
  },
  {
    'code': 'P0045',
    'product': 'Milo',
    'uom': 'pkt',
    'qty': 5,
    'free ctn': '',
    'free pcs': '',
    'price': 15000,
    'discount': 500,
    'tax%': 18,
    'total': 7000,
  },
  {
    'code': 'P0067',
    'product': 'Nido',
    'uom': 'tin',
    'qty': 8,
    'free ctn': '',
    'free pcs': '',
    'price': 18000,
    'discount': 1000,
    'tax%': 18,
    'total': 12500,
  },
  {
    'code': 'P0089',
    'product': 'Cornflakes Brannflex Simbolisis Cornage Siyols',
    'uom': 'box',
    'qty': 12,
    'free ctn': '',
    'free pcs': '',
    'price': 12000,
    'discount': 800,
    'tax%': 18,
    'total': 11000,
  },
  {
    'code': 'P0101',
    'product': 'Weetabix',
    'uom': 'box',
    'qty': 6,
    'free ctn': '',
    'free pcs': '',
    'price': 25000,
    'discount': 2000,
    'tax%': 18,
    'total': 20000,
  },
  {
    'code': 'P0123',
    'product': 'Sugar',
    'uom': 'kg',
    'qty': 15,
    'free ctn': '',
    'free pcs': '',
    'price': 7000,
    'discount': 500,
    'tax%': 18,
    'total': 9500,
  },
  {
    'code': 'P0145',
    'product': 'Milk',
    'uom': 'ltr',
    'qty': 10,
    'free ctn': '',
    'free pcs': '',
    'price': 5000,
    'discount': 300,
    'tax%': 18,
    'total': 4500,
  },
];

