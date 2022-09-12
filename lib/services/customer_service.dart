import 'dart:developer';

import 'package:project/constants/collection.dart';
import 'package:project/data/models/customer/customer_model.dart';

import 'abs_customer.dart';

class CustomerService implements CustomerServiceAbs {
  @override
  Future<bool> delete({required CustomerModel customerModel}) async {
    try {
      await MyCollection.customers
          .doc(customerModel.id)
          .update(customerModel.copyWith(isDeleted: true).toJson());
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Future<bool> edit({required CustomerModel customerModel}) async {
    try {
      MyCollection.customers
          .doc(customerModel.id)
          .update(customerModel.toJson());
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Future<dynamic> getAll() async {
    try {
      return await MyCollection.customers.get();
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Future<bool> insert({required CustomerModel customerModel}) async {
    try {
      MyCollection.customers.doc(customerModel.id).set(customerModel.toJson());
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
