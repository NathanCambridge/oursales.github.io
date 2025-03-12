import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oursales/routes/router.dart';
import 'package:oursales/ui/state_management/sidemenu/active_side_menu_state.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp( const ProviderScope(child:  OurSales()));
}

final activeMenuProvider = ChangeNotifierProvider((ref) => SideMenuProvider());

class OurSales extends StatefulWidget {
  const OurSales({super.key});

  @override
  State<OurSales> createState() => _OurSalesState();
}

class _OurSalesState extends State<OurSales> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ShadApp.materialRouter(
      routerConfig: AppRoutes().router,
      title: 'oursales',
      theme: ShadThemeData(
        disableSecondaryBorder: true,
          colorScheme: ShadZincColorScheme.light(), brightness: Brightness.light,
          textTheme: ShadTextTheme.fromGoogleFont(
            GoogleFonts.openSans,

          ),
        primaryButtonTheme: ShadButtonTheme(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.redAccent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        )
      ),
      darkTheme: ShadThemeData(
        disableSecondaryBorder: true,
        breakpoints: ShadBreakpoints(
          tn: 0, // tiny
          sm: 640, // small
          md: 768, // medium
          lg: 1024, // large
          xl: 1280, // extra large
          xxl: 1536, // extra extra large
        ),
        brightness: Brightness.dark,
        textTheme: ShadTextTheme.fromGoogleFont(
          GoogleFonts.openSans,
        ),
        colorScheme: const ShadSlateColorScheme.dark(
          background: Colors.black,
        ),
        primaryButtonTheme: const ShadButtonTheme(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.cyan],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          // backgroundColor: Colors.cyan,
        ),

      ),

      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}






