import 'dart:async';

import 'package:chat_screen/api/response.dart';
import 'package:chat_screen/models/product.dart';
import 'package:chat_screen/repository/wishlist_repository.dart';

class WishlistBloc {
  WishlistRepository _repository = WishlistRepository();

  final _wishlistCtrller =
      StreamController<Response<List<Product>>>.broadcast();

  Stream<Response<List<Product>>> get wishListStream => _wishlistCtrller.stream;

  StreamSink<Response<List<Product>>> get wishListSink => _wishlistCtrller.sink;

  // get user wishlists
  getWishList(String userId) async {
    wishListSink.add(Response.loading("Getting user wishlist"));

    try {
      final wishlists = await _repository.getWishlist(userId);

      wishListSink.add(Response.completed(wishlists));

      // Test data
      print(" ===> wishlist in bloc logic <=== ");
      print(wishlists[0].name);
    } catch (e) {
      wishListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  // Add product to user wishlists
  addWishlist(String userId, String productId) async {
    wishListSink.add(Response.loading("Add product to wishlist"));

    try {
      final response = await _repository.addWishlist(userId, productId);

      // wishListSink.add(Response.completed(response);
      print(response);

      getWishList(userId);
    } catch (e) {
      wishListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  // Add product from user wishlists
  removeWishlistItem(String userId, String productId) async {
    wishListSink.add(Response.loading("Remove product from wishlist"));

    try {
      final response = await _repository.removeWishlistItem(userId, productId);

      // wishListSink.add(Response.completed(response);
      print(response);

      getWishList(userId);
    } catch (e) {
      wishListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _wishlistCtrller.close();
  }
}
