import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pos_project/model/inventory_model.dart';
import 'package:uuid/uuid.dart';

class InventoryController with ChangeNotifier{

  Uuid uuid = Uuid();

  TextEditingController barcodeNumber = TextEditingController();
  TextEditingController itemName = TextEditingController();
  TextEditingController salePrice = TextEditingController();
  TextEditingController purchasePrice = TextEditingController();
  TextEditingController wholePrice = TextEditingController();
  TextEditingController tax = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController stock = TextEditingController();


  addInventory(BuildContext context){
    String inventoryUid = uuid.v6();

    Inventory inventory = Inventory(
      inventoryUid: inventoryUid,
      barcodeNo: barcodeNumber.text,
      itemName: itemName.text,
      itemType: "",
      salePrice: salePrice.text,
      purchasePrice: purchasePrice.text,
      wholePrice: wholePrice.text,
      tax: tax.text,
      discount: discount.text,
      stock: stock.text,
      supplierName: "",
    );

    FirebaseFirestore.instance.
    collection("inventory").
    doc(inventoryUid).set(inventory.toJson()).then((value){
      Navigator.pop(context);
      barcodeNumber.clear();
      itemName.clear();
      salePrice.clear();
      purchasePrice.clear();
      wholePrice.clear();
      tax.clear();
      discount.clear();
      stock.clear();
    });
  }

}