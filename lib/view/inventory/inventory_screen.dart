import 'package:flutter/material.dart';
import 'package:pos_project/res/component/app_textfield.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTextField(
                      title: "Barcode No",
                      hintText: "Enter Barcode No",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppTextField(
                      title: "Item Name",
                      hintText: "Enter Item Name",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppTextField(
                      title: "Item Type",
                      hintText: "Enter Item Type",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: AppTextField(
                            title: "Purchase Price",
                            hintText: "Enter Purchase Price",
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: AppTextField(
                            title: "Sale Price",
                            hintText: "Enter Sale Price",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppTextField(
                      title: "Whole Price",
                      hintText: "Enter Whole Price",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: AppTextField(
                            title: "Discount",
                            hintText: "Enter Item Discount",
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: AppTextField(
                            title: "Tax",
                            hintText: "Enter Item Tax",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppTextField(
                      title: "Stock Number",
                      hintText: "Enter Stock Number",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppTextField(
                      title: "Supplier Name",
                      hintText: "Enter Supplier Name",
                    ),
                  ],
                ),
              );
            },
          );
        },
        label: Text("Add Inventory"),
      ),
    );
  }
}
