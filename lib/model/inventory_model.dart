class Inventory {
  String? inventoryUid;
  String? barcodeNo;
  String? itemName;
  String? itemType;
  String? salePrice;
  String? purchasePrice;
  String? wholePrice;
  String? tax;
  String? discount;
  String? stock;
  String? supplierName;

  Inventory(
      {
        this.inventoryUid,
        this.barcodeNo,
        this.itemName,
        this.itemType,
        this.salePrice,
        this.purchasePrice,
        this.wholePrice,
        this.tax,
        this.discount,
        this.stock,
        this.supplierName});

  Inventory.fromJson(Map<String, dynamic> json) {
    inventoryUid = json['inventoryUid'];
    barcodeNo = json['barcodeNo'];
    itemName = json['itemName'];
    itemType = json['itemType'];
    salePrice = json['salePrice'];
    purchasePrice = json['purchasePrice'];
    wholePrice = json['wholePrice'];
    tax = json['tax'];
    discount = json['discount'];
    stock = json['stock'];
    supplierName = json['supplierName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inventoryUid'] = this.inventoryUid;
    data['barcodeNo'] = this.barcodeNo;
    data['itemName'] = this.itemName;
    data['itemType'] = this.itemType;
    data['salePrice'] = this.salePrice;
    data['purchasePrice'] = this.purchasePrice;
    data['wholePrice'] = this.wholePrice;
    data['tax'] = this.tax;
    data['discount'] = this.discount;
    data['stock'] = this.stock;
    data['supplierName'] = this.supplierName;
    return data;
  }
}