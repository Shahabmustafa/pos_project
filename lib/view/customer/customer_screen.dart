

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pos_project/res/drawer/drawer.dart';

import '../../res/component/app_textfield.dart';
import '../../res/component/table_text.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  final customerName = TextEditingController();
  final customerEmail = TextEditingController();
  final customerPhone = TextEditingController();
  final customerCNIC = TextEditingController();
  final customerWork = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Customer"),
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
                7: FlexColumnWidth(1.5),
                8: FlexColumnWidth(1.5),
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
                      text: 'Customer Name',
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
                      text: 'CNIC Number',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTableCell(
                      text: 'Work',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTableCell(
                      text: 'Loan',
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
                stream: FirebaseFirestore.instance.collection("customers").snapshots(),
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
                              7: FlexColumnWidth(1.5),
                              8: FlexColumnWidth(1.5),
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
                                    text: snapshot.data!.docs[index]["customerName"],
                                    textColor: Colors.black,
                                  ),
                                  CustomTableCell(
                                    text: snapshot.data!.docs[index]["customerEmail"],
                                    textColor: Colors.black,
                                  ),
                                  CustomTableCell(
                                    text: snapshot.data!.docs[index]["customerPhoneNumber"],
                                    textColor: Colors.black,
                                  ),
                                  CustomTableCell(
                                    text: snapshot.data!.docs[index]["customerCNIC"],
                                    textColor: Colors.black,
                                  ),
                                  CustomTableCell(
                                    text: snapshot.data!.docs[index]["customerWork"],
                                    textColor: Colors.black,
                                  ),
                                  CustomTableCell(
                                    text: snapshot.data!.docs[index]["customerLoan"].toString(),
                                    textColor: Colors.black,
                                  ),
                                  TableCell(
                                    child: InkWell(
                                      onTap: (){},
                                      child: Center(child: Icon(Icons.edit)),
                                    ),
                                  ),
                                  TableCell(
                                    child: InkWell(
                                      onTap: (){},
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
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
                      children: [
                        AppTextField(
                          title: "Name",
                          hintText: "Enter Customer Name",
                          controller: customerName,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppTextField(
                          title: "Email",
                          hintText: "Enter Customer Email",
                          controller: customerEmail,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppTextField(
                          title: "Phone Number",
                          hintText: "Enter Customer Phone Number",
                          controller: customerPhone,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppTextField(
                          title: "CNIC Number",
                          hintText: "Enter Customer CNIC Number",
                          controller: customerCNIC,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppTextField(
                          title: "Work",
                          hintText: "Enter Customer Work",
                          controller: customerWork,
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: (){
                          addCustomer();
                        },
                        child: Text("Add Customer"),
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
        label: Text("Add Customer"),
      ),
    );
  }

  addCustomer()async{
    await FirebaseFirestore.instance.collection("customers").add({
      "customerName" : customerName.text.trim(),
      "customerEmail" : customerEmail.text.trim(),
      "customerPhoneNumber" : customerPhone.text.trim(),
      "customerCNIC" : customerCNIC.text.trim(),
      "customerWork" : customerWork.text.trim(),
      "customerLoan" : 0,
    });
    Navigator.pop(context);
  }
}
