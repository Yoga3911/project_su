import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/presentation/pages/daftar_harga/widgets/add_product.dart';
import 'package:project/presentation/providers/product_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/color.dart';

class DaftarHargaPage extends StatefulWidget {
  const DaftarHargaPage({super.key});

  @override
  State<DaftarHargaPage> createState() => _DaftarHargaPageState();
}

class _DaftarHargaPageState extends State<DaftarHargaPage> {
  late ScrollController _verticalScroll;
  late ScrollController _horizontalScroll;

  @override
  void initState() {
    _verticalScroll = ScrollController();
    _horizontalScroll = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _verticalScroll.dispose();
    _horizontalScroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productProv = context.read<ProductProvider>();
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => const AddProductDialog(),
        ),
        label: Row(
          children: [
            const Icon(Icons.add_box_rounded),
            SizedBox(width: 3.w),
            const Text("Tambah"),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Text(
              "Daftar Harga Produk",
              style: TextStyle(fontSize: 24.sp),
            ),
            SizedBox(height: 20.h),
            FutureBuilder<void>(
              future: productProv.getAll(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: MyColor.blue,
                    ),
                  );
                }

                return Consumer<ProductProvider>(
                  builder: (_, notifier, __) => notifier.getProducts.isEmpty
                      ? Expanded(
                          child: Center(
                            child: Text(
                              "Tidak ada data",
                              style: TextStyle(
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: Scrollbar(
                            controller: _verticalScroll,
                            child: Scrollbar(
                              controller: _horizontalScroll,
                              child: SingleChildScrollView(
                                controller: _verticalScroll,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  controller: _horizontalScroll,
                                  child: DataTable(
                                    headingRowColor:
                                        MaterialStateProperty.all(MyColor.blue),
                                    columns: const [
                                      DataColumn(
                                        label: Text(
                                          'ID',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Nama Produk',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Netto',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Harga Agen',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Harga Distributor',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Harga Swalayan',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Harga Reseller',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Harga Konsumen',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Aksi',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                    rows: [
                                      for (var item in notifier.getProducts)
                                        if (!item.isDeleted!)
                                          DataRow(
                                            cells: [
                                              DataCell(
                                                Text(item.id!),
                                              ),
                                              DataCell(
                                                Text(
                                                  item.productName!,
                                                ),
                                              ),
                                              DataCell(
                                                Text(
                                                  item.netto!.toString(),
                                                ),
                                              ),
                                              DataCell(
                                                Text(
                                                  item.hargaAgen!.toString(),
                                                ),
                                              ),
                                              DataCell(
                                                Text(
                                                  item.hargaDistributor!
                                                      .toString(),
                                                ),
                                              ),
                                              DataCell(
                                                Text(
                                                  item.hargaSwalayan!
                                                      .toString(),
                                                ),
                                              ),
                                              DataCell(
                                                Text(
                                                  item.hargaReseller!
                                                      .toString(),
                                                ),
                                              ),
                                              DataCell(
                                                Text(
                                                  item.hargaKonsumen!
                                                      .toString(),
                                                ),
                                              ),
                                              DataCell(
                                                Row(
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {},
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        backgroundColor:
                                                            Colors.green,
                                                      ),
                                                      child: const Icon(
                                                          Icons.edit_rounded),
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        productProv.delete(
                                                          productModel: item,
                                                        );
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        backgroundColor:
                                                            Colors.red,
                                                      ),
                                                      child: const Icon(
                                                        Icons.delete_rounded,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
