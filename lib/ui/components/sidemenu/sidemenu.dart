import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'collapsed_side_menu.dart';
import 'expanded_side_menu.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  bool renderExpandedSideMenu = false;

  @override
  Widget build(BuildContext context) {
    final colorTheme = ShadTheme.of(context).colorScheme;
    if (renderExpandedSideMenu) {
      return Expanded(
        child: Ink(
          color: colorTheme.secondary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ExpandedSideMenu(menuDetails: [
                (title: 'Dashboard', icon: LucideIcons.chartBar, path: '/'),
                (title: 'Invoice', icon: LucideIcons.airplay, path: '/invoice'),
                (title: 'Orders', icon: LucideIcons.listCheck, path: '/order'),
                (title: 'Inventory', icon: LucideIcons.alarmClock, path: '/inventory')
              ]),
              Ink(
                height: 35,
                decoration: BoxDecoration(color: colorTheme.secondary, borderRadius: BorderRadius.circular(5)),
                child: InkWell(
                  hoverColor: colorTheme.destructive,
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    setState(() {
                      renderExpandedSideMenu = false;
                    });
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Icon(LucideIcons.chevronLeft, size: 15),
                      SizedBox(width: 10),
                      Text('Fold'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Ink(
        color: colorTheme.secondary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CollapsedSideMenu(menuDetails: [
              (icon: LucideIcons.chartBar, path: '/'),
              (icon: LucideIcons.airplay, path: '/invoice'),
              (icon: LucideIcons.listCheck, path: '/order'),
              (icon: LucideIcons.alarmClock, path: '/inventory')
            ]),
            ShadButton.outline(
              icon: Icon(LucideIcons.chevronRight, size: 15),
              onPressed: () {
                setState(() {
                  renderExpandedSideMenu = true;
                });
              },
            ),
          ],
        ),
      );
    }
  }
}
