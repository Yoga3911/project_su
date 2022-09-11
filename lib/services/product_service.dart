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
  Future getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<bool> insert({required ProductModel productModel}) async {
    try {
      final doc = MyCollection.product.doc();
      doc.set(productModel.toJson()..update("id", (value) => doc.id));
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
