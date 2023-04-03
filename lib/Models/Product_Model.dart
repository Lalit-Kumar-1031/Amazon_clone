import 'package:flutter/material.dart';

class ProductModel {
  final String url;
  final String productName;
  final double cost;
  final int discount;
  final String Uid;
  final String sellerName;
  final String sellerUid;
  final int rating;
  final int noOfrating;

  ProductModel({
      required this.url,
      required this.productName,
      required this.cost,
      required this.discount,
      required this.Uid,
      required this.sellerName,
      required this.sellerUid,
      required this.rating,
      required this.noOfrating
  });
}
