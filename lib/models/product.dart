import 'package:chat_screen/models/category.dart';

class Product {
  String id;
  String name;
  String size;
  String color;
  String description;
  String imageUrl;
  int price;
  Category category;

  Product({
    this.id,
    this.name,
    this.price,
    this.size,
    this.category,
    this.color,
    this.description,
    this.imageUrl,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    price = json['price'];
    size = json['size'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    color = json['color'];
    description = json['description'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['size'] = this.size;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['color'] = this.color;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
