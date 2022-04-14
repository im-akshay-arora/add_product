import 'dart:io';

import 'package:add_product_demo/pages/add_product.dart';
import 'package:add_product_demo/providers/product_provider.dart';
import 'package:add_product_demo/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    final isGridValue = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (kIsWeb)
            IconButton(
                onPressed: () {
                  if (isGridValue.isGridView) {
                    isGridValue.isGrid(false);
                  } else {
                    isGridValue.isGrid(true);
                  }
                },
                icon: isGridValue.isGridView
                    ? const Icon(Icons.grid_off)
                    : const Icon(Icons.grid_on)),
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddProduct(
                            isEdit: false,
                            title: "Add Product",
                          ))),
              icon: const Icon(Icons.add_box_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ProductProvider>(
          builder: (context, productValue, Widget? child) {
            return productValue.getProducts.isNotEmpty
                ? productValue.isGridView
                    ? productsGrid(context, productValue.getProducts)
                    : productsList(context, productValue.getProducts)
                : const Center(
                    child: Text("Add Some Products"),
                  );
          },
        ),
      ),
    );
  }
}
