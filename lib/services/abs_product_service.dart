import 'package:project/data/models/product/product_model.dart';

abstract class ProductServiceAbs {
  Future<dynamic> getAll();
  Future<bool> insert({required ProductModel productModel});
  Future<dynamic> edit() async {}
  Future<bool> delete({required ProductModel productModel});
}
