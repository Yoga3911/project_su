import 'dart:developer';

import 'package:project/constants/collection.dart';
import 'package:project/data/models/product/product_model.dart';
import 'package:project/services/abs_product_service.dart';

class ProductService implements ProductServiceAbs {
  @override
  Future<bool> delete({required ProductModel productModel}) async {
    try {
      await MyCollection.products
          .doc(productModel.id)
          .update(productModel.copyWith(isDeleted: true).toJson());
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Future<bool> edit({required ProductModel productModel}) async {
    try {
      MyCollection.products.doc(productModel.id).update(productModel.toJson());
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Future<dynamic> getAll() async {
    try {
      return await MyCollection.products.get();
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Future<bool> insert({required ProductModel productModel}) async {
    try {
      MyCollection.products.doc(productModel.id).set(productModel.toJson());
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
