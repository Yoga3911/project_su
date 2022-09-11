import 'package:cloud_firestore/cloud_firestore.dart';

class MyCollection {
  MyCollection._();

  static final CollectionReference users =
      FirebaseFirestore.instance.collection("users");
  static final CollectionReference product =
      FirebaseFirestore.instance.collection("products");
}
