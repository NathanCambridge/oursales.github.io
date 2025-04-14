import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oursales/util/widget_constants.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ExpandedSideMenu extends StatefulWidget {
  const ExpandedSideMenu({
    super.key,
    required this.menuDetails,
  });

  final List<({IconData icon, String title, String path})> menuDetails;

  @override
  State<ExpandedSideMenu> createState() => _ExpandedSideMenuState();
}

class _ExpandedSideMenuState extends State<ExpandedSideMenu> {
  late List<bool> hovered;

  @override
  void initState() {
    super.initState();
    hovered = List<bool>.filled(widget.menuDetails.length, false);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = ShadTheme.of(context).textTheme;
    final colorTheme = ShadTheme.of(context).colorScheme;
    return Ink(
      decoration: BoxDecoration(color: colorTheme.secondary, borderRadius: BorderRadius.circular(5)),
      child: ListView.builder(
          itemCount: widget.menuDetails.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return ShadButton.ghost(
              onPressed: () {
                context.go(widget.menuDetails[index].path);
              },
              size: ShadButtonSize.sm,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              hoverBackgroundColor: ShadTheme.of(context).colorScheme.destructive,
              icon: Icon(
                widget.menuDetails[index].icon,
              ),
              child: Text(widget.menuDetails[index].title, style: textTheme.small.copyWith(fontSize: 12)),
            );
          }),
    );
  }
}
