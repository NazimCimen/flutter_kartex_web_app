import 'package:flutter/material.dart';
import 'package:kartex_web/product/constants/string_constants.dart';
import 'package:kartex_web/config/routes/app_routes.dart';
import 'package:kartex_web/config/routes/navigator_service.dart';
import 'package:kartex_web/core/size/constant_size.dart';
import 'package:kartex_web/core/size/padding_extension.dart';
import 'package:kartex_web/core/utils/image_enum.dart';
import 'package:kartex_web/feature/home/widgets/navigate_button_widget.dart';
import 'package:kartex_web/responsive/responsive.dart';

class TexttileSection extends StatelessWidget {
  const TexttileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.getWidth(context),
      child: Padding(
        padding: context.cPaddingxLarge,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: ConstantSizes.xLarge.value),
            Text(
              StringConstants.texttile,
              style: TextStyle(
                fontSize: ConstantSizes.xLarge.value,
                color: Theme.of(context).colorScheme.tertiaryFixed,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            Image.asset(
              ImageEnumsPng.bg_texttile.toPathPng,
              height: ConstantSizes.xxLarge.value * 5,
            ),
            SizedBox(height: ConstantSizes.large.value),
            Text(
              StringConstants.texttile_description1,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: ConstantSizes.large.value),
            Text(
              StringConstants.texttile_description2,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: ConstantSizes.xLarge.value),
            Text(
              StringConstants.texttile_description3,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: ConstantSizes.xLarge.value),
            Center(
              child: NavigateButtonWidget(
                text: StringConstants.catalog_button,
                onPress: () {
                  NavigatorService.pushNamed(AppRoutes.catalogView);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
