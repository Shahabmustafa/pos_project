import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_project/res/component/app_textfield.dart';
import 'package:pos_project/res/drawer/drawer.dart';
import 'package:pos_project/viewmodel/inventory/inventory_controller.dart';

import '../../res/component/table_text.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final inventoryController = InventoryController();

  String? _selectedValue;
  List<String> dropdownItems = [];

  Future<void> fetchData() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('types').get();
    List<String> items = snapshot.docs.map((doc) => doc['type'].toString()).toList();

    setState(() {
      dropdownItems = items;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      drawer: DrawerScreen(),
      body: Column(
        children: [
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(1.5),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(3),
                3: FlexColumnWidth(2.5),
                4: FlexColumnWidth(2),
                5: FlexColumnWidth(2),
                6: FlexColumnWidth(2),
                7: FlexColumnWidth(2),
                8: FlexColumnWidth(2),
                9: FlexColumnWidth(2),
                10: FlexColumnWidth(2),
              },
              border: TableBorder.all(
                // borderRadius: BorderRadius.circular(5),
                color: Colors.grey.shade300,
              ),
              defaultColumnWidth: const FlexColumnWidth(0.5),
              children: const [
                TableRow(
                  decoration: BoxDecoration(
                    color: Color(0xff13132a),
                  ),
                  children: [
                    CustomTableCell(
                      text: "#",
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTableCell(
                      text: 'BarCode',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTableCell(
                      text: 'Item Name',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTableCell(
                      text: 'Item Type',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTableCell(
                      text: 'Supplier Name',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTableCell(
                      text: 'Stock',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTableCell(
                      text: 'Tax',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTableCell(
                      text: 'Discount',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTableCell(
                      text: 'Purchase Price',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTableCell(
                      text: 'Whole Sale',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTableCell(
                      text: 'Sale Price',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("inventory").snapshots(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 2.5),
                          child: Table(
                            columnWidths: const {
                              0: FlexColumnWidth(1.5),
                              1: FlexColumnWidth(2),
                              2: FlexColumnWidth(3),
                              3: FlexColumnWidth(2.5),
                              4: FlexColumnWidth(2),
                              5: FlexColumnWidth(2),
                              6: FlexColumnWidth(2),
                              7: FlexColumnWidth(2),
                              8: FlexColumnWidth(2),
                              9: FlexColumnWidth(2),
                              10: FlexColumnWidth(2),
                            },
                            border: TableBorder.all(
                              // borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade200,
                            ),
                            defaultColumnWidth: const FlexColumnWidth(0.5),
                            children: [
                              TableRow(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                children: [
                                  CustomTableCell(
                                    text: '${index + 1}', textColor: Colors.black,
                                  ),
                                  CustomTableCell(
                                    text: snapshot.data!.docs[index]["barcodeNo"],
                                    textColor: Colors.black,
                                  ),
                                  CustomTableCell(
                                    text: snapshot.data!.docs[index]["itemName"],
                                    textColor: Colors.black,
                                  ),
                                  CustomTableCell(
                                    text: snapshot.data!.docs[index]["itemType"],
                                    textColor: Colors.black,
                                  ),
                                  CustomTableCell(
                                    text: snapshot.data!.docs[index]["supplierName"],
                                    textColor: Colors.black,
                                  ),
                                  CustomTableCell(
                                    text: snapshot.data!.docs[index]["stock"],
                                    textColor: Colors.black,
                                  ),
                                  CustomTableCell(
                                    text: snapshot.data!.docs[index]["tax"],
                                    textColor: Colors.black,
                                  ),
                                  CustomTableCell(
                                    text: snapshot.data!.docs[index]["discount"],
                                    textColor: Colors.black,
                                  ),
                                  CustomTableCell(
                                    text: snapshot.data!.docs[index]["purchasePrice"],
                                    textColor: Colors.black,
                                  ),
                                  CustomTableCell(
                                    text: snapshot.data!.docs[index]["wholePrice"],
                                    textColor: Colors.black,
                                  ),
                                  CustomTableCell(
                                    text: snapshot.data!.docs[index]["salePrice"],
                                    textColor: Colors.black,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }else{
                    return Center(child: CircularProgressIndicator());
                  }
                },
              )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          showDialog(
            context: context,
            builder: (context){
              return StatefulBuilder(
                builder: (context,setState){
                  return AlertDialog(
                      scrollable: true,
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppTextField(
                            title: "Barcode No",
                            hintText: "Enter Barcode No",
                            controller: inventoryController.barcodeNumber,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            title: "Item Name",
                            hintText: "Enter Item Name",
                            controller: inventoryController.itemName,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          dropdownItems.isEmpty
                              ? const CircularProgressIndicator() :
                          DropdownButton<String>(
                            isExpanded: true,
                            dropdownColor: Colors.white,
                            focusColor: Colors.grey.shade200,
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            value: _selectedValue,
                            hint: const Text('Select Product Type'),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedValue = newValue;
                              });
                            },
                            items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: AppTextField(
                                  title: "Purchase Price",
                                  hintText: "Enter Purchase Price",
                                  controller: inventoryController.purchasePrice,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: AppTextField(
                                  title: "Sale Price",
                                  hintText: "Enter Sale Price",
                                  controller: inventoryController.salePrice,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            title: "Whole Price",
                            hintText: "Enter Whole Price",
                            controller: inventoryController.wholePrice,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: AppTextField(
                                  title: "Discount",
                                  hintText: "Enter Item Discount",
                                  controller: inventoryController.discount,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: AppTextField(
                                  title: "Tax",
                                  hintText: "Enter Item Tax",
                                  controller: inventoryController.tax,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            title: "Stock Number",
                            hintText: "Enter Stock Number",
                            controller: inventoryController.stock,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            title: "Supplier Name",
                            hintText: "Enter Supplier Name",
                          ),
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: (){
                            inventoryController.addInventory(context);
                          },
                          child: Text("Add Supplier"),
                        ),
                        ElevatedButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"),
                        ),
                      ],
                    );
                  },
              );
            },
          );
        },
        label: Text("Add Product"),
      ),
    );
  }
}
