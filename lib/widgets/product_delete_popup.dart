import 'package:add_product_demo/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDeletePopup extends StatefulWidget {
  const ProductDeletePopup({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  _ProductDeletePopup createState() => _ProductDeletePopup();
}

class _ProductDeletePopup extends State<ProductDeletePopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Confirm"),
      content: const Text("Do you really want to delete ?"),
      actions: [
        TextButton(
          child: const Text("Yes"),
          onPressed: () {
            Provider.of<ProductProvider>(context,listen: false).deleteProduct(widget.index);
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text("No"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
