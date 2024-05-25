import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pos_project/res/component/app_textfield.dart';
import 'package:pos_project/res/component/table_text.dart';
import 'package:pos_project/res/drawer/drawer.dart';

class TypeScreen extends StatefulWidget {
  const TypeScreen({super.key});

  @override
  State<TypeScreen> createState() => _TypeScreenState();
}

class _TypeScreenState extends State<TypeScreen> {
  final type = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Types"),
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
                      text: 'Type Name',
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
              stream: FirebaseFirestore.instance.collection("types").snapshots(),
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
                                  text: snapshot.data!.docs[index]["type"],
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
                                            title: Text("Update Type"),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                AppTextField(
                                                  title: "Type",
                                                  hintText: "Enter Your Type",
                                                  controller: type,
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
                                                        await FirebaseFirestore.instance.collection("type").
                                                        doc(snapshot.data!.docs[index].id).update({
                                                          "type" : type.text.trim(),
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
                                    onTap: (){
                                    },
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
                title: Text("Add Type"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTextField(
                      title: "Type",
                      hintText: "Enter Your Type",
                      controller: type,
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
                            addType();
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
  addType(){
    FirebaseFirestore.instance.collection("types").add({
      "type" : type.text.trim(),
    }).then((value){
      Navigator.pop(context);
    });
  }
}
