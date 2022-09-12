import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project/data/models/customer/customer_model.dart';
import 'package:project/services/customer_service.dart';

class CustomerProvider with ChangeNotifier {
  late CustomerService _customerService;
  static final _single = CustomerProvider._();

  CustomerProvider._() {
    _customerService = CustomerService();
  }

  factory CustomerProvider() => _single;

  Future<bool> insert({required CustomerModel customerModel}) async {
    final cust = customerModel.copyWith(id: "CST-${_customers.length + 1}");
    addProduct = cust;
    return await _customerService.insert(customerModel: cust);
  }

  List<CustomerModel> _customers = [];
  Future<void> getAll() async {
    final response = await _customerService.getAll();
    if (response == false) {
      return;
    }

    setProducts = <CustomerModel>[
      for (var i in response.docs)
        CustomerModel.fromJson(i.data() as Map<String, dynamic>)
    ];

    sortProducts = _customers;
  }

  set setProducts(List<CustomerModel> val) {
    _customers = val;
  }

  set sortProducts(List<CustomerModel> val) {
    log("sorted");
    val.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
  }

  List<CustomerModel> get getProducts => _customers;

  set addProduct(CustomerModel val) {
    _customers.add(val);
    notifyListeners();
  }

  set deleteProduct(CustomerModel val) {
    _customers[_customers.indexOf(val)] = val.copyWith(isDeleted: true);
    notifyListeners();
  }

  set editProduct(CustomerModel val) {
    _customers[_customers.indexOf(
        _customers.where((element) => element.id == val.id).single)] = val;

    notifyListeners();
  }

  Future<bool> delete({required CustomerModel customerModel}) async {
    deleteProduct = customerModel;
    return await _customerService.delete(customerModel: customerModel);
  }

  Future<bool> edit({required CustomerModel customerModel}) async {
    editProduct = customerModel;
    return await _customerService.edit(customerModel: customerModel);
  }

  // ! DROPDOWN
  bool _isTap = false;

  set setIsTap(bool val) {
    _isTap = val;
    notifyListeners();
  }

  bool get getIsTap => _isTap;
}
