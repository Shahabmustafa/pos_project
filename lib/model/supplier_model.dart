class Supplier {
  String? supplierUid;
  String? supplierName;
  String? supplierEmail;
  String? supplierPhoneNumber;
  String? reciverBalance;
  String? senderBalance;

  Supplier(
      {
        this.supplierUid,
        this.supplierName,
        this.supplierEmail,
        this.supplierPhoneNumber,
        this.reciverBalance,
        this.senderBalance});

  Supplier.fromJson(Map<String, dynamic> json) {
    supplierUid = json['supplierUid'];
    supplierName = json['supplierName'];
    supplierEmail = json['supplierEmail'];
    supplierPhoneNumber = json['supplierPhoneNumber'];
    reciverBalance = json['reciverBalance'];
    senderBalance = json['senderBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['supplierUid'] = this.supplierUid;
    data['supplierName'] = this.supplierName;
    data['supplierEmail'] = this.supplierEmail;
    data['supplierPhoneNumber'] = this.supplierPhoneNumber;
    data['reciverBalance'] = this.reciverBalance;
    data['senderBalance'] = this.senderBalance;
    return data;
  }
}