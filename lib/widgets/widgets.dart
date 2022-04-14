import 'package:add_product_demo/models/product_model.dart';
import 'package:add_product_demo/pages/add_product.dart';
import 'package:add_product_demo/widgets/product_delete_popup.dart';
import 'package:flutter/material.dart';

Widget productsList(BuildContext context,List<ProductModel> data) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Container(
          height: height > 600 ? height * 0.25 : height * 0.15,
          width: width,
          decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: const BorderRadius.all(Radius.circular(25.0))),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(data[index].name!,
                      style: TextStyle(
                        fontSize: width > 1200 ? width * 0.03:  width * 0.06
                      ),maxLines: 1,),
                    ),
                    Text(data[index].date!,
                      style: TextStyle(
                          fontSize: width * 0.03
                      ),),
                    Text(data[index].launchSite!,
                      style: TextStyle(
                          fontSize: width * 0.03
                      ),maxLines: 1,),
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                   AddProduct(title: "Edit Product",index:index,isEdit: true,model: data[index],))),
                      icon: const Icon(Icons.edit)),
                  IconButton(
                      onPressed: () async {
                        await showDialog(
                            context: context,
                            builder: (_) =>  ProductDeletePopup(index: index,));
                      },
                      icon: const Icon(Icons.delete)),
                ],
              )
            ],
          ),
        );
      });
}

Widget productsGrid(BuildContext context,List<ProductModel> data) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (1 / .8)),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: const BorderRadius.all(Radius.circular(25.0))),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(data[index].name!,style: TextStyle(
                          fontSize: width * 0.06
                      ),maxLines: 1,),
                    ),
                    Text(data[index].date!,
                      style: TextStyle(
                          fontSize: width * 0.04
                      ),),
                    Text(data[index].launchSite!,
                      style: TextStyle(
                          fontSize: width * 0.04
                      ),
                    maxLines: 2,),
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AddProduct(title: "Edit Product",index:index,isEdit: true,model: data[index],))),
                      icon: const Icon(Icons.edit)),
                  IconButton(
                      onPressed: () async {
                        await showDialog(
                            context: context,
                            builder: (_) =>  ProductDeletePopup(index: index,));
                      },
                      icon: const Icon(Icons.delete)),
                ],
              )
            ],
          ),
        );
      });
}
