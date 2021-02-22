class User {
  String id;
  String username;
  String email;
  String phone;
  String password;
  List<String> wishlist;
  String imageUrl;

  User({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.password,
    this.wishlist,
    this.imageUrl,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    wishlist = json['wishlist'].cast<String>();
    imageUrl = json['image_url'];
  }
}
