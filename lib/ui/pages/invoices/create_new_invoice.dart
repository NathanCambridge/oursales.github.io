import 'package:flutter/material.dart';
import 'package:oursales/ui/components/input_with_search/customer_input_with_search.dart';
import 'package:oursales/ui/components/input_with_search/invoice_base_price.dart';
import 'package:oursales/ui/components/input_with_search/invoice_products.dart';
import 'package:oursales/ui/components/input_with_search/invoice_sales_person.dart';
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
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Create New Invoice',
                style: textTheme.h1Large.copyWith(fontSize: 30, color: colorScheme.primary, fontWeight: FontWeight.bold),
              )),
        ),
      ),
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
                  ],)
                ],
              ),
            )
          ],
        ),
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
