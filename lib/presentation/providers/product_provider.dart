import 'package:flutter/material.dart';
import 'package:project/data/models/product/product_model.dart';

import '../../services/product_service.dart';

class ProductProvider with ChangeNotifier {
  late ProductService _productService;
  static final _single = ProductProvider._();

  ProductProvider._() {
    _productService = ProductService();
  }

  factory ProductProvider() => _single;

  Future<bool> insert({required ProductModel productModel}) async {
    return await _productService.insert(productModel: productModel);
  }
}
