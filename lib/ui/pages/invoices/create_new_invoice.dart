import 'package:flutter/material.dart';
import 'package:oursales/ui/components/input_with_search/customer_input_with_search.dart';
import 'package:oursales/ui/components/input_with_search/invoice_base_price.dart';
import 'package:oursales/ui/components/input_with_search/invoice_products.dart';
import 'package:oursales/ui/components/input_with_search/invoice_sales_person.dart';
import 'package:oursales/ui/pages/invoices/invoice_details.dart';
import 'package:oursales/ui/tables/new_invoice_table/new_invoice_data_table.dart';
import 'package:oursales/ui/tables/new_invoice_table/syncfusion_new_invoice_table.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../components/sidemenu/sidemenu.dart';

class CreateNewInvoice extends StatefulWidget {
  const CreateNewInvoice({super.key});

  @override
  State<CreateNewInvoice> createState() => _CreateNewInvoiceState();
}

class _CreateNewInvoiceState extends State<CreateNewInvoice> {
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
                        Text('New Invoice', style: textTheme.h1.copyWith(fontSize: 18))
                      ],
                    ),
                  ),
                  Row(
                    spacing: 15,
                    children: [
                      InvoiceCustomerList(
                        customers: customers,
                      ),
                      InvoiceSalesPerson(salesPersons: salesPersons),
                      InvoiceBasePrice(basePrices: basePrices)
                    ],
                  ),

                  Row(
                    spacing: 10,
                    children: [
                    InvoiceProducts(products: products),
                    //Quantity input
                    SizedBox(
                        width: 100, child: ShadInput(

                    )),
                    //Base price input
                      SizedBox(
                          width: 150, child: ShadInput(

                      )),

                    //discount input
                      SizedBox(
                          width: 70, child: ShadInput(

                      )),
                    //Add product btn
                    ShadButton(
                      icon: Icon(LucideIcons.plus, size: 15,)
                    )
                  ],),
                  // NewInvoiceDataTable(invoiceItems: invoiceItems),
                  SyncFusionNewInvoiceTable(invoiceItems: invoiceItems)
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
    'free ctn': '',
    'free pcs': '',
    'price': 20000,
    'discount': 0,
    'tax%': '18%',
    'total': 12000,
  },{
    'code': 'P002387723',
    'product': 'Drinking Chocolate 12X450G',
    'uom': 'ctn',
    'free ctn': '',
    'free pcs': '',
    'price': 320000,
    'discount': 0,
    'tax%': '18%',
    'total': 320000,
  },{
    'code': 'P002387723',
    'product': 'Drinking Chocolate 12X450G',
    'uom': 'ctn',
    'free ctn': '',
    'free pcs': '',
    'price': 320000,
    'discount': 0,
    'tax%': '18%',
    'total': 320000,
  },
];
