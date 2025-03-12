import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:oursales/ui/pages/inventory/stock_position.dart';
import 'package:oursales/ui/pages/invoices/create_new_invoice.dart';
import 'package:oursales/ui/pages/invoices/invoice_details.dart';
import 'package:oursales/ui/pages/invoices/invoice_list.dart';
import 'package:oursales/ui/pages/orders/create_new_order.dart';
import 'package:oursales/ui/pages/orders/order_details.dart';
import 'package:oursales/ui/pages/orders/order_list.dart';
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
        GoRoute(
          path: 'order',
          builder: (BuildContext context, GoRouterState state) {
            return const OrderListPage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'order_details',
              builder: (BuildContext context, GoRouterState state) {
                return const OrderDetails();
              },
            ),
            GoRoute(
              path: 'create_new_order',
              builder: (BuildContext context, GoRouterState state) {
                return const CreateNewOrder();
              },
            ),
          ],


        ),
        GoRoute(
          path: 'inventory',
          builder: (BuildContext context, GoRouterState state) {
            return const StockPosition();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'order_details',
              builder: (BuildContext context, GoRouterState state) {
                return const OrderDetails();
              },
            ),
            GoRoute(
              path: 'create_new_order',
              builder: (BuildContext context, GoRouterState state) {
                return const CreateNewOrder();
              },
            ),
          ],


        ),
      ],
    ),
  ], initialLocation: '/', debugLogDiagnostics: true);
}
