import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../res/component/app_textfield.dart';

class SupplierScreen extends StatefulWidget {
  const SupplierScreen({super.key});

  @override
  State<SupplierScreen> createState() => _SupplierScreenState();
}

class _SupplierScreenState extends State<SupplierScreen> {
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
                      title: "Supplier Name",
                      hintText: "Enter Supplier Name",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppTextField(
                      title: "Supplier Email",
                      hintText: "Enter Email",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppTextField(
                      title: "Supplier Phone Number",
                      hintText: "Enter Phone Number",
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
                         ),
                       ),
                       SizedBox(
                         width: 10,
                       ),
                       Flexible(
                         child: AppTextField(
                           title: "Sender Balance",
                           hintText: "Enter Sender Balance",
                         ),
                       ),
                     ],
                   ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: (){},
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
        label: Text("Add Supplier"),
      ),
    );
  }
}
