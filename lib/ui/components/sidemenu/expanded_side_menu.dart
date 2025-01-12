import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      decoration: BoxDecoration(
          color: colorTheme.secondary,
          borderRadius: BorderRadius.circular(5)
      ),
      child: ListView.builder(
        itemCount: widget.menuDetails.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index){
       return Ink(
          height: 40,
          child: InkWell(
            hoverColor: ShadTheme.of(context).colorScheme.destructive,
            borderRadius: BorderRadius.circular(5),
            onTap: (){
              context.go(widget.menuDetails[index].path);
            },
            onHover: (value){
                setState(() {
                  hovered[index] = value;
                });
            },
            child: Row(
              children: [
                SizedBox(width: 15,),
                Icon(
                  widget.menuDetails[index].icon,
                  size: 18,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(widget.menuDetails[index].title, style: textTheme.small,)
              ],
            ),
          ),
        );
      }),
    );
  }
}
