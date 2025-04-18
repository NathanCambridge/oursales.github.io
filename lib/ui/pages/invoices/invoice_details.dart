import 'package:flutter/material.dart';
import 'package:oursales/util/widget_constants.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' as shadcn;
import '../../tables/invoice/invoice_details_table/invoice_details_data_table.dart';

class InvoiceDetails extends StatefulWidget {
  const InvoiceDetails({super.key});

  @override
  State<InvoiceDetails> createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails> {
  @override
  Widget build(BuildContext context) {
    final colorscheme = shadcn.Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorscheme.background,
      appBar: AppBar(
        backgroundColor: colorscheme.background,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Align(
            alignment: Alignment.centerLeft,
              child: Text('Invoice Details', style: kHeaderDefaultFont(context),)),
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

                shadcn.PrimaryButton(leading:Icon(shadcn.BootstrapIcons.pen , size: 15,), enabled: true, alignment: Alignment.centerLeft, child: Text('Edit'),),
                shadcn.PrimaryButton(leading: Icon(shadcn.BootstrapIcons.printer, size: 15,),enabled: true, alignment: Alignment.centerLeft, child: Text('Print' ,),),
              ],
            )
          ],),
          SizedBox(width: 10,)
      ],),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 15, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 5,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('John Simalenga Biyu', style: kHeaderDefaultFont(context),),
                Row(
                  spacing: 5,
                  children: [
                    Text('Invoice:',style: kBoldedDefaultFont(context)),
                    Text('LS/200/2024',style: kDefaultFont(context)),
                  ],
                )
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Arusha, Njiro',style: kBoldedDefaultFont(context)),
                  Row(
                    spacing: 5,
                    children: [
                      Text('Date:',style: kBoldedDefaultFont(context)),
                      Text('12-04-2025',style: kDefaultFont(context)),
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
                          Text('Sales Person:',style: kBoldedDefaultFont(context)),
                          Text('JOHN SHEMBIOL',style: kDefaultFont(context)),
                        ],
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          Text('Creator:',style: kBoldedDefaultFont(context)),
                          Text('SIMON SHINJI',style: kDefaultFont(context)),
                        ],
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          Text('Edited By:',style: kBoldedDefaultFont(context)),
                          Text('SIMON SHINJI',style: kDefaultFont(context)),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    spacing: 5,
                    children: [
                      Text('Status:',style: kBoldedDefaultFont(context)),
                      Text('Supplied',style: kDefaultFont(context)),
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
                      Text('Place of Delivery:',style: kBoldedDefaultFont(context)),
                      Text('Mikocheni B ,',style: kDefaultFont(context))
                    ],),
                  Row(

                    spacing: 5,
                    children: [
                      Text('Delivery Truck:',style: kBoldedDefaultFont(context)),
                      Text('T 102 ABC',style: kDefaultFont(context))
                    ],),
                ],
              ),

              //Loading invoice details table
              InvoiceDetailsDataTable(selectedInvoice: invoice),
              SizedBox(height: 10),
              //Remark Row Details
              Row(
                spacing: 5,
                children: [
                  Text('Remarks:',style: kBoldedDefaultFont(context)),
                  Text('10% Discount given under 10% scheme in Jan 2026',style: kDefaultFont(context)),
                ],
              ),

              // Invoice amount and figures
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Row(
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
                            color: colorscheme.secondary,
                            borderRadius: BorderRadius.circular(7)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text('Total Qty',style: kBoldedDefaultFont(context)),
                            Text('500',style: kDefaultFont(context))
                          ],),
                        ),
                        //Net Amount
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: colorscheme.secondary,
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Net Amount:', style: kBoldedDefaultFont(context),),
                              Text('42,500'
                                  '',style: kDefaultFont(context))
                            ],),
                        ),
                        //Exempted
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: colorscheme.secondary,
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Exempted ',style: kBoldedDefaultFont(context)),
                              Text('0.00',style: kDefaultFont(context))
                            ],),
                        ),
                        //VAT
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: colorscheme.secondary,
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('VAT',style: kBoldedDefaultFont(context)),
                              Text('7,500',style: kDefaultFont(context))
                            ],),
                        ),
                        //Grand Total
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: colorscheme.secondary,
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Grand Total',style: kBoldedDefaultFont(context)),
                              Text('50,000',style: kDefaultFont(context))
                            ],),
                        ),
                      ],
                    ),
                  )
                ],),
              )
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

