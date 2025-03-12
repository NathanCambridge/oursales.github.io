import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oursales/routes/router.dart';
import 'package:oursales/ui/state_management/sidemenu/active_side_menu_state.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const ProviderScope(child: OurSales()));
}

final activeMenuProvider = ChangeNotifierProvider((ref) => SideMenuProvider());
final sideMenuExpandedProvider = ChangeNotifierProvider((ref) => SideMenuProvider());

class OurSales extends StatefulWidget {
  const OurSales({super.key});

  @override
  State<OurSales> createState() => _OurSalesState();
}

class _OurSalesState extends State<OurSales> {
  @override
  Widget build(BuildContext context) {

    return ShadcnApp.router(
      routerConfig: AppRoutes.router,
      title: 'oursales',

      theme: ThemeData(
        colorScheme: ColorSchemes.lightRose(),
        radius: 0.5,
        typography: Typography.geist().copyWith(
          xSmall: GoogleFonts.openSans(fontSize: 12),
          small: GoogleFonts.openSans(fontSize: 15),
          base: GoogleFonts.openSans(),
        ),
        ),
      darkTheme: ThemeData(
        colorScheme: ColorSchemes.darkRose(),
        radius: 0.5,
        typography: Typography.geist().copyWith(
          xSmall: GoogleFonts.openSans(fontSize: 12),
          small: GoogleFonts.openSans(fontSize: 15),
          base: GoogleFonts.openSans(),
        ),

      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}
