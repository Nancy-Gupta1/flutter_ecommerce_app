// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.status,
    this.message,
    this.totalRecord,
    this.totalPage,
    this.data,
  });

  int? status;
  String? message;
  int? totalRecord;
  int? totalPage;
  List<Datum>? data;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    totalRecord: json["totalRecord"] == null ? null : json["totalRecord"],
    totalPage: json["totalPage"] == null ? null : json["totalPage"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "totalRecord": totalRecord == null ? null : totalRecord,
    "totalPage": totalPage == null ? null : totalPage,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.price,
    this.featuredImage,
    this.status,
    this.createdAt,
  });

  int? id;
  String? slug;
  String? title;
  String? description;
  int? price;
  String? featuredImage;
  String? status;
  DateTime? createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    slug: json["slug"] == null ? null : json["slug"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    price: json["price"] == null ? null : json["price"],
    featuredImage: json["featured_image"] == null ? null : json["featured_image"],
    status: json["status"] == null ? null : json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "slug": slug == null ? null : slug,
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "price": price == null ? null : price,
    "featured_image": featuredImage == null ? null : featuredImage,
    "status": status == null ? null : status,
    "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
  };
}
