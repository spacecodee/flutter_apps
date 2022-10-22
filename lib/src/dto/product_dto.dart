// To parse this JSON data, do
//
//     final productDto = productDtoFromJson(jsonString);

import 'dart:convert';

ProductDto productDtoFromJson(String str) => ProductDto.fromJson(json.decode(str));

String productDtoToJson(ProductDto data) => json.encode(data.toJson());

class ProductDto {
  ProductDto({
    this.id = "",
    this.imageUrl = "",
    this.name = "",
    this.price = 0.0,
    this.stock = 0,
  });

  String id;
  String imageUrl;
  String name;
  double price;
  int stock;

  factory ProductDto.fromJson(Map<String, dynamic> json) => ProductDto(
        id: json["id"],
        imageUrl: json["image_url"],
        name: json["name"],
        price: json["price"].toDouble(),
        stock: json["stock"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": imageUrl,
        "name": name,
        "price": price,
        "stock": stock,
      };

  @override
  String toString() {
    return 'ProductDto{id: $id, imageUrl: $imageUrl, name: $name, price: $price, stock: $stock}';
  }
}
