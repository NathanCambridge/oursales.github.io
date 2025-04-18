import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oursales/main.dart';
import 'package:oursales/util/widget_constants.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' as shadcn;
import '../../../util/functions/search_function.dart';
import '../../components/sidemenu/shad_side_menu.dart';
import '../../components/sidemenu/sidemenu.dart';
import '../../tables/orders/order_list_table/order_list_data_table.dart';

class OrderListPage extends ConsumerStatefulWidget {
  const OrderListPage({super.key});

  @override
  ConsumerState<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends ConsumerState<OrderListPage> {
  shadcn.DateTimeRange? _value;
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredOrders = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.watch(orderProvider).getLatestOrders(orders);
    });
    // Show all by default
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: shadcn.Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20,
        ),
        child: Row(
          children: [
            ExpandedSideBar(),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 15,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        shadcn.PrimaryButton(
                          onPressed: () {
                            context.go('/order/create_new_order');
                          },
                          child: const Text('Create Order').xSmall(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 25,
                          children: [
                            shadcn.DefaultTextStyle(
                              style: kDefaultFont(context),
                              child: shadcn.DateRangePicker(
                                value: _value,
                                mode: shadcn.PromptMode.popover,
                                onChanged: (value) {
                                  setState(() {
                                    _value = value;
                                  });
                                },
                              ),
                            ),
                            const shadcn.Gap(16),
                            shadcn.OutlineButton(
                              onPressed: () {},
                              child: Text(
                                'Fetch Data',
                              ).xSmall(),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            shadcn.Text(
                              'TZS 203,155,168.65',
                              style: kHeaderDefaultFont(context),
                            ).small().bold(),
                          ],
                        ),
                        Row(
                          children: [
                            ConstrainedBox(
                                constraints: const BoxConstraints(maxWidth: 250),
                                child: shadcn.TextField(
                                  controller: searchController,
                                  onChanged: (value) {
                                    setState(() {
                                      filteredOrders = updateSearch(value, orders);
                                    });

                                    ref.watch(orderProvider).getLatestOrders(filteredOrders);
                                  },
                                  placeholder: shadcn.Text('Search').xSmall(),
                                  trailing: Icon(
                                    shadcn.LucideIcons.search,
                                    size: 15,
                                  ),
                                )),
                            SizedBox(width: 10)
                          ],
                        )
                      ],
                    ),
                    if (ref.watch(orderProvider).orders.isEmpty)
                      Padding(
                        padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * .25),
                        child: Center(
                            child: Text(
                              'No Order Found',
                              style: kHeaderDefaultFont(context),
                            )),
                      )
                    else
                    OrderListDataTable(
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> orders = [
  {
    'order_date': '14.06.2025',
    'order_number': 'LS/1033/2025',
    'CustomerCode': 'C10988',
    'CustomerName': 'Frank Otieno',
    'order_creator': 'Linda Mushi',
    'Amount': '6,486,306',
    'status': 'completed',
  },
  {
    'order_date': '07.01.2025',
    'order_number': 'LS/1028/2025',
    'CustomerCode': 'C10857',
    'CustomerName': 'Bob Smith',
    'order_creator': 'Peter Ouma',
    'Amount': '8,519,828',
    'status': 'pending',
  },
  {
    'order_date': '28.08.2025',
    'order_number': 'LS/1092/2025',
    'CustomerCode': 'C10689',
    'CustomerName': 'James Mwita',
    'order_creator': 'Sarah Kimani',
    'Amount': '4,723,437',
    'status': 'cancelled',
  },
  {
    'order_date': '10.10.2025',
    'order_number': 'LS/1006/2025',
    'CustomerCode': 'C10994',
    'CustomerName': 'Grace Mburu',
    'order_creator': 'Moses Kariuki',
    'Amount': '1,236,135',
    'status': 'pending',
  },
  {
    'order_date': '25.07.2025',
    'order_number': 'LS/1069/2025',
    'CustomerCode': 'C10192',
    'CustomerName': 'Daniel Kim',
    'order_creator': 'Sarah Kimani',
    'Amount': '6,847,253',
    'status': 'created',
  },
  {
    'order_date': '12.03.2025',
    'order_number': 'LS/1026/2025',
    'CustomerCode': 'C10670',
    'CustomerName': 'Bob Smith',
    'order_creator': 'John Mwangi',
    'Amount': '2,144,769',
    'status': 'created',
  },
  {
    'order_date': '21.09.2025',
    'order_number': 'LS/1071/2025',
    'CustomerCode': 'C10614',
    'CustomerName': 'Cynthia Lee',
    'order_creator': 'Sarah Kimani',
    'Amount': '3,379,800',
    'status': 'cancelled',
  },
  {
    'order_date': '19.05.2025',
    'order_number': 'LS/1075/2025',
    'CustomerCode': 'C10723',
    'CustomerName': 'James Mwita',
    'order_creator': 'Peter Ouma',
    'Amount': '9,170,418',
    'status': 'pending',
  },
  {
    'order_date': '20.07.2025',
    'order_number': 'LS/1043/2025',
    'CustomerCode': 'C10735',
    'CustomerName': 'Emily Clark',
    'order_creator': 'Sarah Kimani',
    'Amount': '3,646,300',
    'status': 'cancelled',
  },
  {
    'order_date': '18.09.2025',
    'order_number': 'LS/1070/2025',
    'CustomerCode': 'C10161',
    'CustomerName': 'Grace Mburu',
    'order_creator': 'John Mwangi',
    'Amount': '6,540,558',
    'status': 'pending',
  },
  {
    'order_date': '09.05.2025',
    'order_number': 'LS/1023/2025',
    'CustomerCode': 'C10724',
    'CustomerName': 'Daniel Kim',
    'order_creator': 'Peter Ouma',
    'Amount': '7,548,526',
    'status': 'created',
  },
  {
    'order_date': '08.03.2025',
    'order_number': 'LS/1082/2025',
    'CustomerCode': 'C10909',
    'CustomerName': 'Irene Wambui',
    'order_creator': 'Linda Mushi',
    'Amount': '9,130,111',
    'status': 'pending',
  },
  {
    'order_date': '04.02.2025',
    'order_number': 'LS/1004/2025',
    'CustomerCode': 'C10895',
    'CustomerName': 'Hassan Njoroge',
    'order_creator': 'Peter Ouma',
    'Amount': '6,460,382',
    'status': 'cancelled',
  },
  {
    'order_date': '29.10.2025',
    'order_number': 'LS/1061/2025',
    'CustomerCode': 'C10295',
    'CustomerName': 'Bob Smith',
    'order_creator': 'Sarah Kimani',
    'Amount': '8,383,875',
    'status': 'completed',
  },
  {
    'order_date': '14.02.2025',
    'order_number': 'LS/1045/2025',
    'CustomerCode': 'C10940',
    'CustomerName': 'Irene Wambui',
    'order_creator': 'Linda Mushi',
    'Amount': '2,117,749',
    'status': 'created',
  },
  {
    'order_date': '30.08.2025',
    'order_number': 'LS/1081/2025',
    'CustomerCode': 'C10783',
    'CustomerName': 'Alice Johnson',
    'order_creator': 'Peter Ouma',
    'Amount': '5,244,732',
    'status': 'completed',
  },
  {
    'order_date': '21.06.2025',
    'order_number': 'LS/1010/2025',
    'CustomerCode': 'C10792',
    'CustomerName': 'Cynthia Lee',
    'order_creator': 'Moses Kariuki',
    'Amount': '6,894,809',
    'status': 'pending',
  },
  {
    'order_date': '27.04.2025',
    'order_number': 'LS/1064/2025',
    'CustomerCode': 'C10977',
    'CustomerName': 'Emily Clark',
    'order_creator': 'Peter Ouma',
    'Amount': '9,302,559',
    'status': 'cancelled',
  },
  {
    'order_date': '10.08.2025',
    'order_number': 'LS/1014/2025',
    'CustomerCode': 'C10587',
    'CustomerName': 'Hassan Njoroge',
    'order_creator': 'Billy',
    'Amount': '6,894,809',
    'status': 'pending',
  }
];
