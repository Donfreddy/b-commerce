import 'package:chat_screen/api/http_client.dart';
import 'package:chat_screen/models/product.dart';

class WishlistRepository {
  // Variable
  dynamic response;
  HttpClient _client = HttpClient();

  Future<List<Product>> getWishlist(String userId) async {
    response = await _client.getRequest("/users/$userId/wishlists");
    List<dynamic> productJson = response['data'];

    return productJson.map((p) => Product.fromJson(p)).toList();
  }

  Future<dynamic> addWishlist(String userId, String productId) async {
    response = await _client.postRequest("/users/$userId/wishlist/$productId");

    return response;
  }

  Future<dynamic> removeWishlistItem(String userId, String productId) async {
    response =
        await _client.deleteRequest("/users/$userId/wishlist/$productId");

    return response;
  }
}
