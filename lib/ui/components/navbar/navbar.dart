
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'navmenu.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.popoverController,
  });

  final ShadPopoverController popoverController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ShadButton(child: Text('logo')),
          Row(children: [
            NavMenu(
              popoverController: popoverController,
              title: 'Hellow',
              subTitle: [(name: 'Sales Reports', route: '/home'), (name: 'Very Long Name', route: '/home/longroute')],
            ),
          ],)
        ],
      ),
    );
  }
}