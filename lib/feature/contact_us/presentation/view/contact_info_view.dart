import 'package:flutter/material.dart';
import 'package:kartex_web/product/constants/string_constants.dart';
import 'package:kartex_web/config/routes/app_routes.dart';
import 'package:kartex_web/config/routes/navigator_service.dart';
import 'package:kartex_web/core/size/constant_size.dart';
import 'package:kartex_web/core/size/padding_extension.dart';
import 'package:kartex_web/core/utils/image_enum.dart';
import 'package:kartex_web/feature/contact_us/presentation/widget/google_map_widget.dart';
import 'package:kartex_web/responsive/responsive.dart';

class ContactInfoView extends StatelessWidget {
  const ContactInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Padding(
      padding: context.cPaddingMedium,
      child: Column(
        children: [
          SizedBox(height: ConstantSizes.large.value),
          Align(
            child: Image.asset(
              ImageEnumsPng.logo.toPathPng,
              height: isMobile ? 200 : 250,
            ),
          ),
          SizedBox(height: ConstantSizes.large.value),
          FittedBox(
            child: Text(
              textAlign: TextAlign.center,
              StringConstants.contact_info_description,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          SizedBox(
            height: isMobile
                ? ConstantSizes.large.value
                : ConstantSizes.xLarge.value,
          ),
          FittedBox(
            child: SelectableText(
              textAlign: TextAlign.center,
              StringConstants.contact_info_adress,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(height: ConstantSizes.small.value / 5),
            ),
          ),
          SizedBox(
            height: isMobile
                ? ConstantSizes.large.value
                : ConstantSizes.xLarge.value,
          ),
          FittedBox(
            child: SelectableText(
              StringConstants.contact_info_phone,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(height: ConstantSizes.small.value / 5),
            ),
          ),
          SizedBox(
            height: isMobile
                ? ConstantSizes.large.value
                : ConstantSizes.xLarge.value,
          ),
          FittedBox(
            child: SelectableText(
              StringConstants.contact_info_mail,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(height: ConstantSizes.small.value / 5),
            ),
          ),
          if (isMobile)
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: ConstantSizes.large.value),
              child: const GoogleMapWidget(),
            )),
          SizedBox(
            height: isMobile
                ? ConstantSizes.large.value
                : ConstantSizes.xLarge.value,
          ),
          TextButton(
            onPressed: () {
              NavigatorService.pushNamed(AppRoutes.contactFormView);
            },
            child: Text(
              StringConstants.contact_info_form_button,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          )
        ],
      ),
    );
  }
}
