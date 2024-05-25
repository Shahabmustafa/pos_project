import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pos_project/res/component/app_textfield.dart';
import 'package:pos_project/res/component/table_text.dart';
import 'package:pos_project/res/drawer/drawer.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({super.key});

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {

  final brand = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brands"),
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
                1: FlexColumnWidth(5),
                2: FlexColumnWidth(1.5),
                3: FlexColumnWidth(1.5),
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
                      text: 'Brand Name',
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
              stream: FirebaseFirestore.instance.collection("brands").snapshots(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Table(
                          columnWidths: const {
                            0: FlexColumnWidth(1.5),
                            1: FlexColumnWidth(5),
                            2: FlexColumnWidth(1.5),
                            3: FlexColumnWidth(1.5),
                          },
                          border: TableBorder.all(
                            // borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade300,
                          ),

                          defaultColumnWidth: const FlexColumnWidth(0.5),
                          children: [
                            TableRow(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              children: [
                                CustomTableCell(
                                  text: "${index + 1}",
                                  textColor: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomTableCell(
                                  text: snapshot.data!.docs[index]["brand"],
                                  textColor: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                TableCell(
                                  child: InkWell(
                                    onTap: (){
                                      showDialog(
                                        context: context,
                                        builder: (context){
                                          return AlertDialog(
                                            title: Text("Update Brand"),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                AppTextField(
                                                  title: "Brand",
                                                  hintText: "Enter Your Brand",
                                                  controller: brand,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: (){
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Cancel"),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: ()async{
                                                        await FirebaseFirestore.instance.collection("brands").
                                                        doc(snapshot.data!.docs[index].id).update({
                                                          "brand" : brand.text.trim(),
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Update"),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
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
            ),
          )

        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                title: Text("Add Brand"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTextField(
                      title: "Brand",
                      hintText: "Enter Your Brand",
                      controller: brand,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: (){

                          },
                          child: Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: (){
                            addBrand();
                          },
                          child: Text("Add"),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        label: Text("Add Brand"),
      ),
    );
  }

  addBrand(){
    FirebaseFirestore.instance.collection("brands").add({
      "brand" : brand.text.trim(),
    }).then((value){
      Navigator.pop(context);
    });
  }
}
