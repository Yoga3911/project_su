import 'dart:developer';

import 'package:project/constants/collection.dart';
import 'package:project/data/models/product/product_model.dart';
import 'package:project/services/abs_product_service.dart';

class ProductService implements ProductServiceAbs {
  @override
  Future deleteProduct() {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future editProduct() {
    // TODO: implement editProduct
    throw UnimplementedError();
  }

  @override
  Future getAllProduct() {
    // TODO: implement getAllProduct
    throw UnimplementedError();
  }

  @override
  Future<bool> insertProduct({required ProductModel productModel}) async {
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
