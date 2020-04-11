import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:g_mart/models/products.dart';
import 'package:g_mart/models/user.dart';
import 'package:g_mart/utils/constants.dart';
import 'package:intl/intl.dart';

class DatabaseService {

  final String userId;

  DatabaseService({this.userId});

  CollectionReference usersRef = Firestore.instance.collection(USERS_REF);
  CollectionReference productsRef = Firestore.instance.collection(PRODUCTS_REF);

  Future setUserData({String email, String role, String username}) async {
    return await usersRef.document(userId).setData({
      'username': username,
      'email': email,
      'role': role,
      'createdAt': DateFormat.yMMMd().format(DateTime.now()),
    });
  }

  List<User> _allUsers(QuerySnapshot snapshot) {
    return snapshot.documents.map((each) {
      return User(
          username: each.data['username'],
          email: each.data['email'],
          role: each.data['role'],
          userId: each.data['uid']);
    }).toList();
  }

  Stream<List<User>> get users => usersRef.snapshots().map(_allUsers);

  Future addProduct(Products product) async {
    DocumentReference documentReference =
    await productsRef.add(product.productsToMap());
    product.productId = documentReference.documentID;
    await documentReference.setData(product.productsToMap(), merge: true);
  }

  Stream<List<Products>> get products =>
      productsRef.snapshots().map(_allProducts);

  List<Products> _allProducts(QuerySnapshot snapshot) {
    return snapshot.documents.map((product) {
      Products products = Products.fromMap(product.data);
      return products;
    }).toList();
  }

  Future<Products> getSingleProduct(String id) async {
    await productsRef.document(id).get().then((product) {
      return Products.fromDocumentSnapshot(product);
    });
  }

}