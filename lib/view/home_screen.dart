import 'package:flutter/material.dart';
import 'package:pos_project/view/dashboard/dashboard_screen.dart';
import 'package:pos_project/view/inventory/inventory_screen.dart';
import 'package:pos_project/view/order/order_screen.dart';
import 'package:pos_project/view/report/report_screen.dart';
import 'package:pos_project/view/sale/sale_screen.dart';
import 'package:pos_project/view/supplier/supplier_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: "Dashboard",),
              Tab(text: "Sale",),
              Tab(text: "Inventory",),
              Tab(text: "Order",),
              Tab(text: "Supplier",),
              Tab(text: "Report",),
            ],
          ),
          title: Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: [
            DashboardScreen(),
            SaleScreen(),
            InventoryScreen(),
            OrderScreen(),
            SupplierScreen(),
            ReportScreen(),
          ],
        ),
      ),
    );
  }
}
