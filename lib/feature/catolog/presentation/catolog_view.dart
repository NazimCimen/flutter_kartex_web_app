import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartex_web/product/constants/string_constants.dart';
import 'package:kartex_web/core/size/constant_size.dart';
import 'package:kartex_web/core/size/dynamic_size.dart';
import 'package:kartex_web/core/size/padding_extension.dart';
import 'package:kartex_web/core/utils/image_enum.dart';
import 'package:kartex_web/product/constants/custom_shadows.dart';
import 'package:kartex_web/responsive/responsive.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({super.key});

  List<Product> get products => [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInDown(
              child: Stack(
                children: [
                  Image.asset(
                    ImageEnumsPng.bg_catalog.toPathPng,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.9),
                    ),
                  ),
                  Align(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: context.dynamicWidht(0.025)),
                        Image.asset(
                          ImageEnumsPng.logo.toPathPng,
                          width: context.dynamicWidht(0.1),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: context.dynamicWidht(0.015)),
                        Text(
                          StringConstants.catolog_title,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontSize: context.dynamicWidht(0.03),
                                fontFamily: GoogleFonts.afacad().fontFamily,
                                shadows: CustomShadows.customLowShadow(context),
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: ConstantSizes.large.value),
            Padding(
              padding: Responsive.isDesktop(context)
                  ? context.cPaddingxLarge
                  : Responsive.isTablet(context)
                      ? context.cPaddingLarge
                      : context.cPaddingMedium,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Responsive.isMobile(context) ? 1 : 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  childAspectRatio: 16 / 7,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return FadeInUp(child: ProductCard(product: product));
                },
              ),
            ),
            SizedBox(height: ConstantSizes.large.value),
          ],
        ),
      ),
    );
  }
}

class Product {
  const Product({
    required this.imagePath,
    required this.name,
    required this.description,
  });
  final String imagePath;
  final String name;
  final String description;
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    super.key,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: context.paddingAllMedium,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.asset(
                product.imagePath,
                fit: BoxFit.contain,
                height: context.dynamicWidht(0.015),
              ),
            ),
            SizedBox(width: context.dynamicWidht(0.015)),
            Expanded(
              child: Padding(
                padding: context.paddingAllLow,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: FittedBox(
                        child: Text(
                          product.name,
                          style: TextStyle(
                            fontSize: Responsive.isMobile(context)
                                ? context.dynamicWidht(0.04)
                                : Responsive.isTablet(context)
                                    ? context.dynamicWidht(0.03)
                                    : context.dynamicWidht(0.02),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: context.dynamicWidht(0.01)),
                    Container(
                      height: context.dynamicWidht(0.005),
                      width: context.dynamicWidht(0.04),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(height: context.dynamicWidht(0.015)),
                    Flexible(
                      child: Text(
                        product.description,
                        style: TextStyle(
                          fontSize: Responsive.isMobile(context)
                              ? context.dynamicWidht(0.025)
                              : Responsive.isTablet(context)
                                  ? context.dynamicWidht(0.009)
                                  : context.dynamicWidht(0.01),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
