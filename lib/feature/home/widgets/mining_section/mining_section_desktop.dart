import 'package:flutter/material.dart';
import 'package:kartex_web/product/constants/string_constants.dart';
import 'package:kartex_web/core/size/constant_size.dart';
import 'package:kartex_web/core/size/padding_extension.dart';
import 'package:kartex_web/core/utils/image_enum.dart';
import 'package:kartex_web/feature/home/widgets/section_title_text_widget.dart';
import 'package:kartex_web/responsive/responsive.dart';

class MiningSectionDesktop extends StatelessWidget {
  const MiningSectionDesktop({
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
                    ImageEnumsPng.bg_mining.toPathPng,
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
                          text: StringConstants.mining,
                        ),
                        SizedBox(height: ConstantSizes.large.value),
                        Text(
                          StringConstants.mining_description1,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(height: ConstantSizes.large.value),
                        Text(
                          StringConstants.mining_description2,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(height: ConstantSizes.xLarge.value),
                        Text(
                          StringConstants.mining_description3,
                          style: Theme.of(context).textTheme.bodyLarge,
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
