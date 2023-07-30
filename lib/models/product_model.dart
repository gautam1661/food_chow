import 'package:flutter/foundation.dart';

class ProductModel {
  final int id;
  final String shop_name;
  final String shop_id;
  final String? shoplogo;
  final String shop_type;
  final String mobileno;
  final String delivery_method;
  final String cuisine;
  final String city;
  final String address;
  final String? cuisine_image;
  final String currency;

  ProductModel({
    required this.id,
    required this.shop_name,
    required this.shop_id,
    this.shoplogo,
    required this.shop_type,
    required this.mobileno,
    required this.delivery_method,
    required this.cuisine,
    required this.city,
    required this.address,
    this.cuisine_image,
    required this.currency,
  });

  factory ProductModel.fromjson(Map<String,dynamic> json) => ProductModel(
      id: json['id'],
      shop_name: json['shop_name'],
      shop_id: json['shop_id'],
      shop_type: json['shop_type'],
      mobileno: json['mobileno'],
      delivery_method: json['delivery_method'],
      cuisine: json['cuisine'],
      city: json['city'],
      address: json['address'],
      currency: json['currency'],
  );
}
