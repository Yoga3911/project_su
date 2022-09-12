import 'package:project/data/models/customer/customer_model.dart';

abstract class CustomerServiceAbs {
  Future<dynamic> getAll();
  Future<bool> insert({required CustomerModel customerModel});
  Future<dynamic> edit({required CustomerModel customerModel});
  Future<bool> delete({required CustomerModel customerModel});
}
