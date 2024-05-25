import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_project/res/drawer/drawer.dart';
import 'package:pos_project/viewmodel/supplier/supplier_controller.dart';
import 'package:provider/provider.dart';

import '../../res/component/app_textfield.dart';
import '../../res/component/table_text.dart';

class SupplierScreen extends StatefulWidget {
  const SupplierScreen({super.key});

  @override
  State<SupplierScreen> createState() => _SupplierScreenState();
}

class _SupplierScreenState extends State<SupplierScreen> {
  final supplierController = SupplierController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Supplier"),
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
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(3),
                3: FlexColumnWidth(2.5),
                4: FlexColumnWidth(2),
                5: FlexColumnWidth(2),
                6: FlexColumnWidth(1.5),
                7: FlexColumnWidth(1.5),
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
                      text: 'Supplier Name',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTableCell(
                      text: 'Email',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTableCell(
                      text: 'Phone Number',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTableCell(
                      text: 'Receiver Balance',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTableCell(
                      text: 'Sender Balance',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTableCell(
                      text: 'Edit',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTableCell(
                      text: 'Delete',
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
              stream: FirebaseFirestore.instance.collection("supplier").snapshots(),
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
                            1: FlexColumnWidth(3),
                            2: FlexColumnWidth(3),
                            3: FlexColumnWidth(2.5),
                            4: FlexColumnWidth(2),
                            5: FlexColumnWidth(2),
                            6: FlexColumnWidth(1.5),
                            7: FlexColumnWidth(1.5),
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
                                  text: snapshot.data!.docs[index]["supplierName"],
                                  textColor: Colors.black,
                                ),
                                CustomTableCell(
                                  text: snapshot.data!.docs[index]["supplierEmail"],
                                  textColor: Colors.black,
                                ),
                                CustomTableCell(
                                  text: snapshot.data!.docs[index]["supplierPhoneNumber"],
                                  textColor: Colors.black,
                                ),
                                CustomTableCell(
                                  text: snapshot.data!.docs[index]["reciverBalance"],
                                  textColor: Colors.black,
                                ),
                                CustomTableCell(
                                  text: snapshot.data!.docs[index]["senderBalance"],
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
                  builder: (BuildContext context, setState){
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppTextField(
                            title: "Supplier Name",
                            hintText: "Enter Supplier Name",
                            controller: supplierController.supplierName,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            title: "Supplier Email",
                            hintText: "Enter Email",
                            controller: supplierController.supplierEmail,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            title: "Supplier Phone Number",
                            hintText: "Enter Phone Number",
                            controller: supplierController.supplierPhoneNumber,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: AppTextField(
                                  title: "Receiver Balance",
                                  hintText: "Enter Receiver Balance",
                                  controller: supplierController.receiverBalance,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: AppTextField(
                                  title: "Sender Balance",
                                  hintText: "Enter Sender Balance",
                                  controller: supplierController.senderBalance,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: (){
                            supplierController.addSupplier(context);
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
        label: Text("Add Supplier"),
      ),
    );
  }
}
