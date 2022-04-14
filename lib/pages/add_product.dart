import 'package:add_product_demo/models/product_model.dart';
import 'package:add_product_demo/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  const AddProduct(
      {Key? key, required this.title, this.index,required this.isEdit, this.model})
      : super(key: key);
  final String title;
  final int? index;
  final bool isEdit;
  final ProductModel? model;

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<ProductProvider>(context);
    if (widget.isEdit) {
      validationService.productNameController.text = widget.model!.name!;
      validationService.productLaunchedSiteController.text =
          widget.model!.launchSite!;
      validationService.dateController.text = widget.model!.date!;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: validationService.formGlobalKey,
            child: widget.isEdit
                ? ListView(
                    children: [
                      TextFormField(
                          decoration: const InputDecoration(
                              labelText:
                                  "Enter Product Name"),
                          controller: validationService.productNameController,
                          validator: (name) {
                            if (name!.isEmpty) {
                              return 'Enter Product Name!';
                            }
                            return null;
                          }),
                      TextFormField(
                          controller:
                              validationService.productLaunchedSiteController,
                          decoration: const InputDecoration(
                              labelText: "Enter Site Name"),
                          validator: (site) {
                            if (site!.isEmpty) {
                              return "Enter Site Name!";
                            }
                            return null;
                          }),
                      TextFormField(
                        readOnly: true,
                        controller: validationService.dateController,
                        decoration:
                            const InputDecoration(labelText: "Select Date"),
                        onTap: () {
                          validationService.selectDate(context);
                        },
                      ),
                      ElevatedButton(
                          onPressed: () {
                              validationService.updateProduct(
                                  widget.index!,
                                  ProductModel(
                                      validationService
                                          .productNameController.text,
                                      validationService.dateController.text,
                                      validationService
                                          .productLaunchedSiteController.text,
                                      3.5));
                          },
                          child: const Text("Update")),
                    ],
                  )
                : ListView(
                    children: [
                      TextFormField(
                          decoration: const InputDecoration(
                              labelText: "Enter Product Name"),
                          controller: validationService.productNameController,
                          validator: (name) {
                            if (name!.isEmpty) {
                              return 'Enter Product Name!';
                            }
                            return null;
                          }),
                      TextFormField(
                          controller:
                              validationService.productLaunchedSiteController,
                          decoration: const InputDecoration(
                              labelText: "Enter Site Name"),
                          validator: (site) {
                            if (site!.isEmpty) {
                              return "Enter Site Name!";
                            }
                            return null;
                          }),
                      TextFormField(
                        readOnly: true,
                        controller: validationService.dateController,
                        decoration: const InputDecoration(labelText: "Select Date"),
                        validator: (date) {
                          if (date!.isEmpty) {
                            return "Enter Date!";
                          }
                          return null;
                        },
                        onTap: () {
                          validationService.selectDate(context);
                        },
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (validationService.formGlobalKey.currentState!
                                .validate()) {
                              validationService.addProduct(
                                  validationService.productNameController.text,
                                  validationService.date,
                                  validationService
                                      .productLaunchedSiteController.text,
                                  3.8);
                            }
                          },
                          child: const Text("Submit")),
                    ],
                  )),
      ),
    );
  }
}
