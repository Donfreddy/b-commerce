import 'package:chat_screen/api/http_client.dart';
import 'package:chat_screen/models/product.dart';

class ProductRepository {
  HttpClient _provider = HttpClient();

  Future<List<Product>> getProducts() async {
    var response =
        await _provider.getRequest("/products?cat=any&page=1&size=1");

    // Test data
    print(" ===> Products in repository logic <=== ");
    print(response['totalItems']);
    print(response['totalPages']);
    print(response['currentPage']);

    List<dynamic> productJson = response['data'];

    final productlist = productJson.map((p) => Product.fromJson(p)).toList();

    return productlist;
  }

  /// `name` is name of the cotegory
  Future<List<Product>> getProductsPerCategory(String name) async {
    var response =
        await _provider.getRequest("/products?cat=$name&page=1&size=1");

    // Test data
    print(response.data);
    List<dynamic> productJson = response.data;

    return productJson.map((p) => Product.fromJson(p)).toList();
  }
}
