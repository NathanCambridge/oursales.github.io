import 'package:flutter/material.dart';
import 'package:oursales/ui/tables/invoice_details_table/invoice_details_data_table.dart';
import 'package:oursales/util/widget_constants.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class InvoiceDetails extends StatelessWidget {
  const InvoiceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = ShadTheme.of(context).textTheme;
    final colorScheme = ShadTheme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Align(
            alignment: Alignment.centerLeft,
              child: Text('Invoice Details', style: textTheme.h1Large.copyWith(fontSize: 30, color: colorScheme.primary, fontWeight: FontWeight.bold ),)),
        ),
        leadingWidth: double.infinity,
        automaticallyImplyLeading: false,
        actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [

            ],),
            Row(
              spacing: 10,
              children: [

                ShadButton(icon: Icon(LucideIcons.filePenLine, size: 15,), height: 30, child: Text('Edit' ,),),
                ShadButton(icon: Icon(LucideIcons.printer, size: 15,), height: 30, child: Text('Print' ,),),
              ],
            )
          ],),
          SizedBox(width: 10,)
      ],),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 15, left: 12, right: 12),
        child: SingleChildScrollView(
          child: Column(
            spacing: 5,
            children: [
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('John Simalenga Biyu', style: textTheme.large.copyWith(fontSize: 23),),
                Row(
                  spacing: 5,
                  children: [
                    Text('Invoice:',style: textTheme.small.copyWith(fontWeight: FontWeight.bold)),
                    Text('LS/200/2024'),
                  ],
                )
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Arusha, Njiro'),
                  Row(
                    spacing: 5,
                    children: [
                      Text('Date:',style: textTheme.small.copyWith(fontWeight: FontWeight.bold)),
                      Text('12-04-2025'),
                    ],
                  )
                ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          Text('Sales Person:',style: textTheme.small.copyWith(fontWeight: FontWeight.bold)),
                          Text('JOHN SHEMBIOL'),
                        ],
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          Text('Creator:',style: textTheme.small.copyWith(fontWeight: FontWeight.bold)),
                          Text('SIMON SHINJI'),
                        ],
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          Text('Edited By:', style: textTheme.small.copyWith(fontWeight: FontWeight.bold),),
                          Text('SIMON SHINJI'),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    spacing: 5,
                    children: [
                      Text('Status:',style: textTheme.small.copyWith(fontWeight: FontWeight.bold)),
                      Text('Supplied'),
                    ],
                  )
                ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 5,
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      Text('Place of Delivery:',style: textTheme.small.copyWith(fontWeight: FontWeight.bold)),
                      Text('Mikocheni B ,')
                    ],),
                  Row(
          
                    spacing: 5,
                    children: [
                      Text('Delivery Truck:',style: textTheme.small.copyWith(fontWeight: FontWeight.bold)),
                      Text('T 102 ABC')
                    ],),
                ],
              ),
          
              //Loading invoice details table
              InvoiceDetailsDataTable(selectedInvoice: invoice),

              //Remark Row Details
              Row(
                spacing: 5,
                children: [
                  Text('Remarks:', style: textTheme.small.copyWith(fontWeight: FontWeight.bold)),
                  Text('10% Discount given under 10% scheme in Jan 2026'),
                ],
              ),

              // Invoice amount and figures
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  child: Column(
                    spacing: 5,
                    children: [
                      //Total Quantity
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: colorScheme.secondary,
                          borderRadius: BorderRadius.circular(7)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text('Total Qty', style: textTheme.small.copyWith(fontWeight: FontWeight.bold, fontSize: kWidgetFontSize)),
                          Text('500')
                        ],),
                      ),
                      //Net Amount
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: colorScheme.secondary,
                            borderRadius: BorderRadius.circular(7)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Net Amount:', style: textTheme.small.copyWith(fontWeight: FontWeight.bold, fontSize: kWidgetFontSize)),
                            Text('42,500'
                                '')
                          ],),
                      ),
                      //Exempted
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: colorScheme.secondary,
                            borderRadius: BorderRadius.circular(7)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Exempted ', style: textTheme.small.copyWith(fontWeight: FontWeight.bold, fontSize: kWidgetFontSize)),
                            Text('0.00')
                          ],),
                      ),
                      //VAT
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: colorScheme.secondary,
                            borderRadius: BorderRadius.circular(7)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('VAT', style: textTheme.small.copyWith(fontWeight: FontWeight.bold, fontSize: kWidgetFontSize)),
                            Text('7,500')
                          ],),
                      ),
                      //Grand Total
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: colorScheme.secondary,
                            borderRadius: BorderRadius.circular(7)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Grand Total', style: textTheme.small.copyWith(fontWeight: FontWeight.bold, fontSize: kWidgetFontSize)),
                            Text('50,000')
                          ],),
                      ),
                    ],
                  ),
                )
              ],)
          ],),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> invoice = [
  {
    '#': '1',
    'Description': 'Drinking Chocolate 12X450G',
    'Quantity': '200',
    'Rate': '320,000',
    'UOM': 'CTN',
    'Disc %': '12.654142',
    'Total': '1,202,564',
    'Tax %': '18%',
  },
  {
    '#': '2',
    'Description': 'Milk Powder 24X250G',
    'Quantity': '150',
    'Rate': '150,000',
    'UOM': 'CTN',
    'Disc %': '10.452360',
    'Total': '850,000',
    'Tax %': '10%',
  },
  {
    '#': '3',
    'Description': 'Sugar 50KG',
    'Quantity': '500',
    'Rate': '500,000',
    'UOM': 'KG',
    'Disc %': '5.752310',
    'Total': '2,450,000',
    'Tax %': '5%',
  },
  {
    '#': '4',
    'Description': 'Rice 25KG',
    'Quantity': '300',
    'Rate': '250,000',
    'UOM': 'KG',
    'Disc %': '8.932120',
    'Total': '1,900,000',
    'Tax %': '15%',
  },
  {
    '#': '5',
    'Description': 'Cooking Oil 12X1L',
    'Quantity': '100',
    'Rate': '120,000',
    'UOM': 'L',
    'Disc %': '7.123450',
    'Total': '600,000',
    'Tax %': '18%',
  },
  {
    '#': '6',
    'Description': 'Soap 48X250G',
    'Quantity': '250',
    'Rate': '50,000',
    'UOM': 'PCS',
    'Disc %': '3.654870',
    'Total': '1,200,000',
    'Tax %': '0%',
  },
];

