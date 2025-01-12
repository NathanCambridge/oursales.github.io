import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../components/sidemenu/sidemenu.dart';

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
    final textTheme = ShadTheme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only( top: 20, right: 20,),
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
                    ShadButton(child: Text('New Invoice', style: textTheme.small.copyWith(fontSize: 15),),)
                  ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        ShadDatePicker.range(placeholder: Text('Start - End Date', style: textTheme.small.copyWith(fontSize: 13)),
                        closeOnSelection: true,
                        hideWeekdayNames: true,),

                        ShadButton.outline(
                          child: Text('Fetch Data'),
                        )
                      ],),
                      Row(children: [
                        Text('TZS 203,155,168.65', style: textTheme.small.copyWith(fontWeight: FontWeight.w600),)
                      ],),
                      Row(children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 250),
                          child: const ShadInput(
                            placeholder: Text('Search'),
                            prefix: Icon(LucideIcons.search, size: 15,),
                          ),
                        ),
                      ],)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
