import 'package:flutter/material.dart';
import 'package:kartex_web/product/constants/string_constants.dart';
import 'package:kartex_web/config/routes/app_routes.dart';
import 'package:kartex_web/config/routes/navigator_service.dart';
import 'package:kartex_web/core/size/constant_size.dart';
import 'package:kartex_web/core/size/padding_extension.dart';
import 'package:kartex_web/core/utils/image_enum.dart';
import 'package:kartex_web/feature/home/widgets/navigate_button_widget.dart';
import 'package:kartex_web/feature/home/widgets/section_title_text_widget.dart';
import 'package:kartex_web/responsive/responsive.dart';

class TexttileSectionDesktop extends StatelessWidget {
  const TexttileSectionDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.getWidth(context),
      child: Padding(
        padding: context.cPaddingxxLarge,
        child: Column(
          children: [
            SizedBox(height: ConstantSizes.large.value * 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Image.asset(
                    ImageEnumsPng.bg_texttile.toPathPng,
                    height: ConstantSizes.xxLarge.value * 7,
                  ),
                ),
                SizedBox(width: ConstantSizes.large.value * 2),
                Flexible(
                  flex: 2,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: ConstantSizes.xxLarge.value * 7,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SectionTitleTextWidget(
                          text: StringConstants.texttile,
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
                ),
              ],
            ),
            SizedBox(height: ConstantSizes.xLarge.value),
          ],
        ),
      ),
    );
  }
}
