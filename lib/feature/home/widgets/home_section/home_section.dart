import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:kartex_web/product/constants/string_constants.dart';
import 'package:kartex_web/core/size/constant_size.dart';
import 'package:kartex_web/core/utils/image_enum.dart';
import 'package:kartex_web/feature/home/widgets/navigate_button_widget.dart';
import 'package:kartex_web/responsive/responsive.dart';

class HomeSection extends StatelessWidget {
  final VoidCallback homeSectionButton;
  const HomeSection({
    required this.isMobile,
    required this.homeSectionButton,
    super.key,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final isMobile = Responsive.isMobile(context);

    return SizedBox(
      width: Responsive.getWidth(context),
      height: ConstantSizes.largePageHeight.value,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              ImageEnumsPng.bg_home.toPathPng,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: isDesktop
                  ? ConstantSizes.large.value * 12
                  : ConstantSizes.large.value * 2,
              right: isDesktop
                  ? ConstantSizes.large.value * 12
                  : ConstantSizes.large.value,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  child: Image.asset(
                    ImageEnumsPng.logo_border.toPathPng,
                    width: !isMobile ? 235 : 170,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: ConstantSizes.xLarge.value * 2),
                Text(
                  StringConstants.appName,
                  style: isDesktop
                      ? Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: Theme.of(context).colorScheme.tertiaryFixed,
                          )
                      : Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: Theme.of(context).colorScheme.tertiaryFixed,
                          ),
                ),
                SizedBox(
                  height: ConstantSizes.large.value,
                ),
                if (isMobile)
                  Text(
                    StringConstants.main_screen_description,
                    maxLines: 15,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(overflow: TextOverflow.ellipsis),
                  ),
                if (!isMobile)
                  Text(
                    StringConstants.main_screen_description,
                    maxLines: 15,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(overflow: TextOverflow.ellipsis),
                  ),
                SizedBox(height: ConstantSizes.xLarge.value),
                FadeInUp(
                  child: NavigateButtonWidget(
                    text: StringConstants.contact_us,
                    onPress: homeSectionButton,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
