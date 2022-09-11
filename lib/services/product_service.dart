import 'dart:developer';

import 'package:project/constants/collection.dart';
import 'package:project/data/models/product/product_model.dart';
import 'package:project/services/abs_product_service.dart';

class ProductService implements ProductServiceAbs {
  @override
  Future delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future edit() {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getAll() async {
    try {
      return await MyCollection.product.get();
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Future<bool> insert({required ProductModel productModel}) async {
    try {
      MyCollection.product.doc(productModel.id).set(productModel.toJson());
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
