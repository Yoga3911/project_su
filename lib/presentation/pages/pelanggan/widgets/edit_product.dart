import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constants/fonts.dart';
import 'package:project/data/models/customer/customer_model.dart';
import 'package:project/presentation/providers/customer_provider.dart';
import 'package:project/utils/loading.dart';
import 'package:project/utils/snackbar.dart';
import 'package:provider/provider.dart';

import '../../../../constants/color.dart';
import 'category_dropdown.dart';

class EditCustomerDialog extends StatefulWidget {
  final CustomerModel customerModel;
  const EditCustomerDialog({
    super.key,
    required this.customerModel,
  });

  @override
  State<EditCustomerDialog> createState() => _EditCustomerDialogState();
}

class _EditCustomerDialogState extends State<EditCustomerDialog> {
  late TextEditingController _namaPelanggan;
  late TextEditingController _alamat;
  late TextEditingController _nomorTelp;
  late TextEditingController _kategoriHarga;

  @override
  void initState() {
    _namaPelanggan = TextEditingController();
    _alamat = TextEditingController();
    _nomorTelp = TextEditingController();
    _kategoriHarga = TextEditingController();
    _namaPelanggan.text = widget.customerModel.name!;
    _alamat.text = widget.customerModel.address!;
    _nomorTelp.text = widget.customerModel.telp!;
    final category = widget.customerModel.priceCategory!;
    _kategoriHarga.text = category == 1
        ? "Agen"
        : category == 2
            ? "Distributor"
            : category == 3
                ? "Swalayan"
                : category == 1
                    ? "Reseller"
                    : "Konsumen";
    super.initState();
  }

  @override
  void dispose() {
    _namaPelanggan.dispose();
    _alamat.dispose();
    _nomorTelp.dispose();
    _kategoriHarga.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prov = context.read<CustomerProvider>();
    return AlertDialog(
      scrollable: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Tambah Produk Baru",
            style: TextStyle(fontSize: 20.sp, fontFamily: MyFont.semiBold),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.cancel),
            iconSize: 35.r,
            color: Colors.red,
          ),
        ],
      ),
      content: SizedBox(
        width: 150.w,
        child: Column(
          children: [
            TextField(
              controller: _namaPelanggan,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.shopping_cart_rounded),
                hintText: "Budi Santoso",
                label: const Text("Nama Pelanggan"),
                filled: true,
                fillColor: MyColor.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: MyColor.blue),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              controller: _alamat,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.scale_rounded),
                hintText: "Jl. Mawar 12 no 101",
                label: const Text("Alamat"),
                filled: true,
                fillColor: MyColor.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: MyColor.blue),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              controller: _nomorTelp,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9]"))
              ],
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.attach_money_rounded),
                hintText: "08881231231",
                label: const Text("Nomor Telepon"),
                filled: true,
                fillColor: MyColor.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: MyColor.blue),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              controller: _kategoriHarga,
              readOnly: true,
              onTap: () {
                prov.setIsTap = !prov.getIsTap;
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.price_change_rounded),
                label: const Text("Kategori Harga"),
                filled: true,
                fillColor: MyColor.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: MyColor.blue),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            PriceCategoryDropdown(controller: _kategoriHarga),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor: Colors.grey,
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
          ),
          child: const Text("Batal"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (_) => const CustomLoading(),
            );
            final dateOnMili = DateTime.now().millisecondsSinceEpoch;
            _kategoriHarga.text = _kategoriHarga.text == "Agen"
                ? "1"
                : _kategoriHarga.text == "Distributor"
                    ? "2"
                    : _kategoriHarga.text == "Swalayan"
                        ? "3"
                        : "4";
            context
                .read<CustomerProvider>()
                .edit(
                  customerModel: widget.customerModel.copyWith(
                    name: _namaPelanggan.text,
                    address: _alamat.text,
                    telp: _nomorTelp.text,
                    priceCategory: int.tryParse(_kategoriHarga.text) ?? 0,
                    updatedAt: dateOnMili,
                  ),
                )
                .then(
              (value) {
                Navigator.pop(context);
                value
                    ? showSnackbar(
                        context,
                        "Produk berhasil diubah",
                        Colors.green,
                      )
                    : showSnackbar(
                        context,
                        "Produk gagal diubah",
                        Colors.red,
                      );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
          ),
          child: const Text("Simpan"),
        ),
      ],
    );
  }
}
