import 'package:project/data/models/product/product_model.dart';

abstract class ProductServiceAbs {
  Future<dynamic> getAllProduct() async {}
  Future<bool> insertProduct({required ProductModel productModel});
  Future<dynamic> editProduct() async {}
  Future<dynamic> deleteProduct() async {}
}
