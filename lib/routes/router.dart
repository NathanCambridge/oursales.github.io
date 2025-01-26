import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:oursales/ui/pages/invoices/create_new_invoice.dart';
import 'package:oursales/ui/pages/invoices/invoice_details.dart';
import 'package:oursales/ui/pages/invoices/invoice_list.dart';
import '../ui/pages/dashboard/dashboard.dart';

class AppRoutes {
  final GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const DashboardPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'invoice',
          builder: (BuildContext context, GoRouterState state) {
            return const InvoiceListPage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'invoice_details',
              builder: (BuildContext context, GoRouterState state) {
                return const InvoiceDetails();
              },
            ),
            GoRoute(
              path: 'create_new_invoice',
              builder: (BuildContext context, GoRouterState state) {
                return const CreateNewInvoice();
              },
            ),
          ],


        ),
      ],
    ),
  ], initialLocation: '/', debugLogDiagnostics: true);
}
