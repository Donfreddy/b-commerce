import 'dart:async';

import 'package:chat_screen/api/response.dart';
import 'package:chat_screen/models/product.dart';
import 'package:chat_screen/repository/product_repository.dart';

class ProductBloc {
  ProductRepository _repository = ProductRepository();

  final _productCtrller = StreamController<Response<List<Product>>>.broadcast();

  Stream<Response<List<Product>>> get productListStream =>
      _productCtrller.stream;

  StreamSink<Response<List<Product>>> get productListSink =>
      _productCtrller.sink;

  ProductBloc() {
    getProductList();
  }

  getProductList() async {
    productListSink.add(Response.loading("Getting products list"));

    try {
      final productList = await _repository.getProducts();
      productListSink.add(Response.completed(productList));

      // Test data
      print(" ===> Products in bloc logic <=== ");
      print(productList[0].name);
    } catch (e) {
      productListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  getProductsPerCategory(String name) async {
    productListSink
        .add(Response.loading("Getting products per $name category "));

    try {
      final productList = await _repository.getProductsPerCategory(name);
      productListSink.add(Response.completed(productList));

      // Test data
      print(productList);
    } catch (e) {
      productListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _productCtrller?.close();
  }
}
