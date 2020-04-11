import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Products with ChangeNotifier{

  String productId;
  String name;
//  final String desc;
  String imageUrl;
  String productCode;
  String measurementUnit;
  DateTime createdAt;
  DateTime updatedAt;
  int quantity;
  double costPerUnit;
  double sellingPrice;
  bool isFavorite;

  Products({
    @required this.productId,
    @required this.name,
//    this.desc,
    @required this.imageUrl,
    @required this.productCode,
    @required this.measurementUnit,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.quantity,
    @required this.costPerUnit,
    @required this.sellingPrice,
    @required this.isFavorite,
  });

  Map<String, dynamic> productsToMap(){
    return {
      'productId': productId,
      'name': name,
      'image': imageUrl,
//      'desc': desc,
      'code': productCode,
      'measurementUnit': measurementUnit,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'quantity': quantity,
      'costPerUnit': costPerUnit,
      'sellingPrice': sellingPrice,
      'isFavorite': isFavorite,
    };
  }

  /**
   *  Map products from firebase to json
   * **/
  Products.fromMap(Map<dynamic, dynamic> jsonData){
    productId = jsonData['productId'];
    name = jsonData['name'];
    imageUrl = jsonData['imageUrl'];
    productCode = jsonData['code'];
    measurementUnit = jsonData['measurementUnit'];
    createdAt = jsonData['createdAt'];
    updatedAt = jsonData['updatedAt'];
    quantity = jsonData['quantity'];
    costPerUnit = jsonData['costPerUnit'];
    sellingPrice = jsonData['sellingPrice'];
    isFavorite = jsonData['isFavorite'];
  }

  Products.fromDocumentSnapshot(DocumentSnapshot snapshot){
    productId = snapshot.data['productId'];
    name = snapshot.data['name'];
    imageUrl = snapshot.data['imageUrl'];
    productCode = snapshot.data['code'];
    measurementUnit = snapshot.data['measurementUnit'];
    createdAt = snapshot.data['createdAt'];
    updatedAt = snapshot.data['updatedAt'];
    quantity = snapshot.data['quantity'];
    costPerUnit = snapshot.data['costPerUnit'];
    sellingPrice = snapshot.data['sellingPrice'];
    isFavorite = snapshot.data['isFavorite'];
  }

  void toggleFavoriteStatus(){
    isFavorite = !isFavorite;
    notifyListeners();
  }

}