import 'package:add_product_demo/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier{

  final formGlobalKey = GlobalKey<FormState>();
  var productNameController = TextEditingController();
  var productLaunchedSiteController = TextEditingController();
  var dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  bool _isGridView = false;
  String get date => "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}";
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2022,1),
        lastDate: DateTime(2101));
    if(picked != null){
      _selectedDate = picked;
      dateController.text = date;
    }
    notifyListeners();
  }
  List<ProductModel> _products = <ProductModel>[];
  List<ProductModel> get getProducts{
    return _products;
  }

  bool get isGridView => _isGridView;
  void isGrid(bool value){
    _isGridView = value;
    notifyListeners();
  }

  void updateProduct(int index,ProductModel productModel){
    _products[index] = productModel;
    dateController.clear();
    productNameController.clear();
    productLaunchedSiteController.clear();
    notifyListeners();
  }
  void addProduct(String name,String date,String launchSite,double popularity){
    ProductModel model = ProductModel(name, date, launchSite, popularity);
    _products.add(model);
    dateController.clear();
    productNameController.clear();
    productLaunchedSiteController.clear();
    notifyListeners();
  }

  void deleteProduct(int index){
    _products.removeAt(index);
    notifyListeners();
  }
}