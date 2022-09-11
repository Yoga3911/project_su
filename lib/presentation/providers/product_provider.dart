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
    final prod = productModel.copyWith(id: "PRD-${_products.length + 1}");
    addProduct = prod;
    notifyListeners();
    return await _productService.insert(productModel: prod);
  }

  List<ProductModel> _products = [];
  Future<void> getAll() async {
    final response = await _productService.getAll();
    if (response == false) {
      return;
    }

    setProducts = <ProductModel>[
      for (var i in response.docs)
        ProductModel.fromJson(i.data() as Map<String, dynamic>)
    ];
  }

  set setProducts(List<ProductModel> val) {
    _products = val;
    // notifyListeners();
  }

  List<ProductModel> get getProducts => _products;

  set addProduct(ProductModel val) {
    _products.add(val);
  }
}
