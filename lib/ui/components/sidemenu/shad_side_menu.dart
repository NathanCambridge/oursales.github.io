import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oursales/main.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import '../../../util/widget_constants.dart';

class ExpandedSideBar extends ConsumerStatefulWidget {
  const ExpandedSideBar({super.key});

  @override
  ConsumerState<ExpandedSideBar> createState() => _ExpandedSideBarState();
}

class _ExpandedSideBarState extends ConsumerState<ExpandedSideBar> {
  int selected = 0;

  NavigationItem buildButton(String text, IconData icon) {
    return NavigationItem(
      label: Text(text,),
      alignment: Alignment.centerLeft,
      selectedStyle: ButtonStyle.primaryIcon(),
      child: Icon(icon  ),
    );
  }

  NavigationLabel buildLabel(String label) {
    return NavigationLabel(
      alignment: Alignment.centerLeft,
      child: Text(label,).semiBold().muted(),
      // padding: EdgeInsets.zero,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IntrinsicWidth(
      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        NavigationRail(
            backgroundColor: theme.colorScheme.card,
            labelType: NavigationLabelType.expanded,
            labelPosition: NavigationLabelPosition.end,
            alignment: NavigationRailAlignment.start,
            expanded: ref.watch(sideMenuExpandedProvider).sideMenuExpanded,
            index: selected,
            onSelected: (value) {
              setState(() {
                selected = value;
                print(sideBarItems[value]['route']);
                context.go('/invoice');
              });
            },
            children: [
              NavigationButton(
                alignment: Alignment.centerLeft,
                label: Text('Menu'),
                onPressed: () {
                  setState(() {
                    ref.watch(sideMenuExpandedProvider).getSideMenuState(!ref.watch(sideMenuExpandedProvider).sideMenuExpanded);
                  });
                },
                child: Icon(Icons.menu),
              ),
              NavigationButton(
                  alignment: Alignment.centerLeft,
                  label: Text('Dashboard'),
                onPressed: (){
                  context.go('/');
                },
                  child: Icon(Icons.router)),
              NavigationDivider(),
              buildLabel('Invoice'),
              buildButton(sideBarItems[0]['invoice']['name'], BootstrapIcons.listCheck),
              buildButton('Sales Order', BootstrapIcons.clipboard2Data),
              buildButton('Credit Note', BootstrapIcons.journalX),
              NavigationDivider(),
              buildLabel('Inventory'),
              buildButton('Current Stock', BootstrapIcons.cartFill),
              buildButton('Movement Analysis', BootstrapIcons.reception4),
              buildButton('Stock Transfer', BootstrapIcons.arrowDownUp),
              buildButton('Stock Journal', BootstrapIcons.bookHalf),
              NavigationDivider(),
              buildLabel('Purchase'),
              buildButton('Purchase Invoice', BootstrapIcons.databaseFillCheck),
              buildButton('Good Receipt Note', BootstrapIcons.clipboardPlusFill),
              buildButton('Purchase Order', BootstrapIcons.backpack4Fill),
              NavigationDivider(),
              buildLabel('Reports'),
              buildButton('Sales Report', BootstrapIcons.activity),
              buildButton('Attendance Report', Icons.waterfall_chart),
              buildButton('Visit Report', Icons.movie_creation_outlined),
              NavigationDivider(),
              buildLabel('Master'),
              buildButton('Supplier', Icons.movie_creation_outlined),
              buildButton('Product', Icons.movie_creation_outlined),
              buildButton('Customers', Icons.movie_creation_outlined),
              buildButton('Back Office Promo', Icons.movie_creation_outlined),
              buildButton('Mobile Promo', Icons.movie_creation_outlined),
            ]),
        const VerticalDivider(),
        const Flexible(child: SizedBox()),
      ]),
    );
  }
}


List<Map<String, dynamic>> sideBarItems = [{'invoice':{'name':'Sales Invoices', 'icon':BootstrapIcons.listCheck, 'route': '/invoice'}}];
