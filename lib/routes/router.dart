import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/pages/dashboard/dashboard.dart';
import '../ui/pages/inventory/stock_position.dart';
import '../ui/pages/invoices/create_new_invoice.dart';
import '../ui/pages/invoices/invoice_details.dart';
import '../ui/pages/invoices/invoice_list.dart';
import '../ui/pages/orders/create_new_order.dart';
import '../ui/pages/orders/order_details.dart';
import '../ui/pages/orders/order_list.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
        const DashboardPage(),
        routes: <RouteBase>[
          GoRoute(
            path: 'invoice',
            builder: (context, state) => const InvoiceListPage(),
            routes: [
              GoRoute(
                path: 'invoice_details',
                builder: (context, state) => const InvoiceDetails(),
              ),
              GoRoute(
                path: 'create_new_invoice',
                builder: (context, state) => const CreateNewInvoice(),
              ),
            ],
          ),
          GoRoute(
            path: 'order',
            builder: (context, state) => const OrderListPage(),
            routes: [
              GoRoute(
                path: 'order_details',
                builder: (context, state) => const OrderDetails(),
              ),
              GoRoute(
                path: 'create_new_order',
                builder: (context, state) => const CreateNewOrder(),
              ),
            ],
          ),
          GoRoute(
            path: 'inventory',
            builder: (context, state) => const StockPosition(),
            routes: [
              GoRoute(
                path: 'order_details',
                builder: (context, state) => const OrderDetails(),
              ),
              GoRoute(
                path: 'create_new_order',
                builder: (context, state) => const CreateNewOrder(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
