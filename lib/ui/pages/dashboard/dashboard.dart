import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
            ExpandableSidebarExample1,
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.blue,
                child: Column(
                  children: [
                    Text('Dashboard here')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
