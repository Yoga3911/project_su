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

    sortProducts = _products;
  }

  set setProducts(List<ProductModel> val) {
    _products = val;
  }

  set sortProducts(List<ProductModel> val) {
    val.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
  }

  List<ProductModel> get getProducts => _products;

  set addProduct(ProductModel val) {
    _products.add(val);
    notifyListeners();
  }

  set deleteProduct(ProductModel val) {
    _products[_products.indexOf(val)] = val.copyWith(isDeleted: true);
    notifyListeners();
  }

  set editProduct(ProductModel val) {
    _products[_products.indexOf(
        _products.where((element) => element.id == val.id).single)] = val;

    notifyListeners();
  }

  Future<bool> delete({required ProductModel productModel}) async {
    deleteProduct = productModel;
    return await _productService.delete(productModel: productModel);
  }

  Future<bool> edit({required ProductModel productModel}) async {
    editProduct = productModel;
    return await _productService.edit(productModel: productModel);
  }
}
