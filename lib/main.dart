import 'package:flutter/material.dart';
import 'package:oursales/routes/router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const OurSales());
}

class OurSales extends StatefulWidget {
  const OurSales({super.key});

  @override
  State<OurSales> createState() => _OurSalesState();
}

class _OurSalesState extends State<OurSales> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ShadApp.router(
      routerConfig: AppRoutes().router,
      title: 'oursales',
      darkTheme: ShadThemeData(
        breakpoints: ShadBreakpoints(
          tn: 0, // tiny
          sm: 640, // small
          md: 768, // medium
          lg: 1024, // large
          xl: 1280, // extra large
          xxl: 1536, // extra extra large
        ),
        brightness: Brightness.dark,
        colorScheme: const ShadSlateColorScheme.dark(
          background: Colors.black,
        ),
        primaryButtonTheme: const ShadButtonTheme(
          backgroundColor: Colors.cyan,
        ),

      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}






