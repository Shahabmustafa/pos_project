import 'package:flutter/material.dart';
import 'package:pos_project/view/customer/customer_screen.dart';
import 'package:pos_project/view/dashboard/dashboard_screen.dart';
import 'package:pos_project/view/product/brand_screen.dart';
import 'package:pos_project/view/product/product_screen.dart';
import 'package:pos_project/view/product/type_screen.dart';
import 'package:pos_project/view/supplier/supplier_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: Text("DashBoard"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
            },
          ),
          ListTile(
            title: Text("Sale"),
          ),
          ExpansionTile(
            title: Text("Inventory"),
            children: [
              ListTile(
                title: Text("Type"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TypeScreen()));
                },
              ),
              ListTile(
                title: Text("Brand"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BrandScreen()));
                },
              ),
              ListTile(
                title: Text("Product"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));
                },
              ),
            ],
          ),
          ListTile(
            title: Text("Customer"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerScreen()));
            },
          ),
          ListTile(
            title: Text("Supplier"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SupplierScreen()));
            },
          ),
          ListTile(
            title: Text("Order"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SupplierScreen()));
            },
          ),
          ExpansionTile(
            title: Text("Reports"),
            children: [
              // ListTile(
              //   title: Text("Categories"),
              // ),
              // ListTile(
              //   title: Text("Brands"),
              // ),
              // ListTile(
              //   title: Text("Products"),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
