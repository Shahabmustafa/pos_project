import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pos_project/model/supplier_model.dart';
import 'package:uuid/uuid.dart';

class SupplierController with ChangeNotifier{

  Uuid uuid = Uuid();

  List<Supplier> supplier = [];

  TextEditingController supplierName = TextEditingController();
  TextEditingController supplierEmail = TextEditingController();
  TextEditingController supplierPhoneNumber = TextEditingController();
  TextEditingController receiverBalance = TextEditingController();
  TextEditingController senderBalance = TextEditingController();

  addSupplier(BuildContext context){
    String supplierUid = uuid.v6();
    Supplier supplier = Supplier(
      supplierUid: supplierUid,
      supplierName: supplierName.text,
      supplierEmail: supplierEmail.text,
      supplierPhoneNumber: supplierPhoneNumber.text,
      reciverBalance: receiverBalance.text,
      senderBalance: senderBalance.text,
    );
    FirebaseFirestore.instance.
    collection("supplier")
    .doc(supplierUid)
    .set(supplier.toJson()).then((value){
      Navigator.pop(context);
      supplierName.clear();
      supplierEmail.clear();
      supplierPhoneNumber.clear();
      receiverBalance.clear();
      senderBalance.clear();
    });
  }

  List<Supplier> getSupplierData(){
    FirebaseFirestore.instance.
    collection("supplier").
    snapshots().
    listen((supplier) {
      this.supplier = supplier.docs.
      map((e) => Supplier.fromJson(e.data())).toList();
      notifyListeners();
      print(supplier);
    });
    return supplier;
  }

}