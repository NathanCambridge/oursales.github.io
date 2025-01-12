import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CollapsedSideMenu extends StatefulWidget {
  const CollapsedSideMenu({
    super.key,
    required this.menuDetails,
  });

  final List<({IconData icon, String path})> menuDetails;

  @override
  State<CollapsedSideMenu> createState() => _CollapsedSideMenuState();
}

class _CollapsedSideMenuState extends State<CollapsedSideMenu> {
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
      width: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              ListView.builder(
                itemCount: widget.menuDetails.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index){
               return Ink(
                  height: 35,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5),
                    hoverColor: colorTheme.destructive,
                    onTap: (){
                      context.go(widget.menuDetails[index].path);
                    },
                    onHover: (value){
                      setState(() {
                        hovered[index] = value;
                      });

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 5,),
                        Icon(
                          widget.menuDetails[index].icon,
                          size: 20,
                          color: hovered[index] ? colorTheme.secondary: colorTheme.primary,
                        ),
                        SizedBox(width: 5,),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
