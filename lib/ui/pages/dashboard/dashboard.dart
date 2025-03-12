import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../components/sidemenu/shad_side_menu.dart';
import '../../components/sidemenu/sidemenu.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final popoverController = ShadPopoverController();
  final menuController = ShadPopoverController();

  @override
  void dispose() {
    popoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only( right: 20),
        child: Row(
          children: [
            ExpandedSideBar(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Dashboard here'),
                      Text('Dashboard two'),
                    ],
                  ),
                  Container(color: Colors.black, child: Text('Hello Bamby'),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
