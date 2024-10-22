import 'package:flutter/material.dart';
import 'package:kartex_web/core/utils/image_enum.dart';
import 'package:kartex_web/product/constants/string_constants.dart';
import 'package:kartex_web/product/model/catalog_product.dart';
import 'package:kartex_web/product/model/feature_item.dart';

@immutable
final class AppItems {
  const AppItems._();
  static List<FeatureItem> drawerItems = [
    FeatureItem(
      icon: Icons.home_outlined,
      text: StringConstants.main_screen,
    ),
    FeatureItem(
      icon: Icons.star_outline,
      text: StringConstants.texttile,
    ),
    FeatureItem(
      icon: Icons.sentiment_satisfied_outlined,
      text: StringConstants.mining,
    ),
    FeatureItem(
      icon: Icons.app_shortcut_outlined,
      text: StringConstants.contact_us,
    ),
  ];
  static List<Product> get products => [
        Product(
          imagePath: ImageEnumsPng.product1.toPathPng,
          name: StringConstants.product1_title,
          description: StringConstants.product1_description,
        ),
        Product(
          imagePath: ImageEnumsPng.product2.toPathPng,
          name: StringConstants.product2_title,
          description: StringConstants.product2_description,
        ),
        Product(
          imagePath: ImageEnumsPng.product3.toPathPng,
          name: StringConstants.product3_title,
          description: StringConstants.product3_description,
        ),
        Product(
          imagePath: ImageEnumsPng.product4.toPathPng,
          name: StringConstants.product4_title,
          description: StringConstants.product4_description,
        ),
        Product(
          imagePath: ImageEnumsPng.product5.toPathPng,
          name: StringConstants.product5_title,
          description: StringConstants.product5_description,
        ),
        Product(
          imagePath: ImageEnumsPng.product6.toPathPng,
          name: StringConstants.product6_title,
          description: StringConstants.product6_description,
        ),
        Product(
          imagePath: ImageEnumsPng.product7.toPathPng,
          name: StringConstants.product7_title,
          description: StringConstants.product7_description,
        ),
        Product(
          imagePath: ImageEnumsPng.product8.toPathPng,
          name: StringConstants.product8_title,
          description: StringConstants.product8_description,
        ),
        Product(
          imagePath: ImageEnumsPng.product9.toPathPng,
          name: StringConstants.product9_title,
          description: StringConstants.product9_description,
        ),
        Product(
          imagePath: ImageEnumsPng.product10.toPathPng,
          name: StringConstants.product10_title,
          description: StringConstants.product10_description,
        ),
        Product(
          imagePath: ImageEnumsPng.product11.toPathPng,
          name: StringConstants.product11_title,
          description: StringConstants.product11_description,
        ),
        Product(
          imagePath: ImageEnumsPng.product12.toPathPng,
          name: StringConstants.product12_title,
          description: StringConstants.product12_description,
        ),
      ];
}
