import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class NavMenu extends StatefulWidget {
  const NavMenu({super.key, required this.popoverController, required this.title, required this.subTitle});

  final ShadPopoverController popoverController;
  final String title;
  final List<({String name, String route})> subTitle;

  @override
  State<NavMenu> createState() => _NavMenuState();
}

class _NavMenuState extends State<NavMenu> {
  @override
  void initState() {
    super.initState();
    isHovered = List<bool>.filled(widget.subTitle.length, false);
  }

  late List<bool> isHovered;
  @override
  Widget build(BuildContext context) {
    final textTheme = ShadTheme.of(context).textTheme;
    return ShadPopover(
      padding: EdgeInsets.zero,
      controller: widget.popoverController,
      popover: (context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            widget.subTitle.length,
                (index) => InkWell(
              onHover: (hover) {
                setState(() {
                  isHovered[index] = hover;
                });
              },
              onTap: () {
                widget.popoverController.hide();
                setState(() {
                  isHovered[index] = false;
                });

                // Going to the specified path
                Navigator.pushNamed(context, widget.subTitle[index].route);
              },
              child: Ink(
                decoration: BoxDecoration(
                    color: isHovered[index] ? Colors.green : Colors.transparent, borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.subTitle[index].name,
                      style: textTheme.small.copyWith(
                          color: isHovered[index]
                              ? ShadTheme.of(context).colorScheme.destructive
                              : ShadTheme.of(context).colorScheme.primary)),
                ),
              ),
            ),
          ),
        ),
      ),
      child: InkWell(
        onHover: (hovered) {
          widget.popoverController.show();
        },
        onTap: () {},
        child: ShadButton.ghost(
          onPressed: widget.popoverController.toggle,
          child: Row(
            children: [
              Text(
                widget.title,
                style: textTheme.small,
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                LucideIcons.chevronDown,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}