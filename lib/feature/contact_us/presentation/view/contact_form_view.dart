import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:kartex_web/product/constants/string_constants.dart';
import 'package:kartex_web/core/size/constant_size.dart';
import 'package:kartex_web/core/size/padding_extension.dart';
import 'package:kartex_web/core/utils/app_validators.dart';
import 'package:kartex_web/core/utils/image_enum.dart';
import 'package:kartex_web/feature/contact_us/presentation/mixin/contact_form_view_mixin.dart';
import 'package:kartex_web/product/constants/custom_shadows.dart';
import 'package:kartex_web/product/widgets/custom_text_form_field.dart';
import 'package:kartex_web/responsive/responsive.dart';

class ContactFromView extends StatefulWidget {
  const ContactFromView({super.key});

  @override
  State<ContactFromView> createState() => _ContactFromViewState();
}

class _ContactFromViewState extends State<ContactFromView>
    with ContactFromViewMixin {
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Scaffold(
      body: Row(
        children: [
          if (!isMobile)
            const Expanded(
              flex: 40,
              child: _LeftSide(),
            ),
          Expanded(
            flex: 60,
            child: Form(
              autovalidateMode: validateMode,
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: !isMobile
                        ? ConstantSizes.xLarge.value
                        : ConstantSizes.medium.value,
                    right: !isMobile
                        ? ConstantSizes.xLarge.value
                        : ConstantSizes.medium.value,
                  ),
                  child: Column(
                    children: [
                      if (feedbackMessage != null)
                        Padding(
                          padding: context.cPaddingSmall,
                          child: Text(
                            feedbackMessage!,
                            style: TextStyle(
                              color: sendMailSucces
                                  ? Theme.of(context)
                                      .colorScheme
                                      .tertiaryContainer
                                  : Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      SizedBox(height: ConstantSizes.large.value),
                      FadeInUp(
                        child: Text(
                          StringConstants.form_title,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      SizedBox(
                        height: ConstantSizes.xLarge.value,
                      ),
                      FadeInUp(
                        child: CustomTextFormField(
                          controller: nameController,
                          validator: (value) =>
                              AppValidators.nameValidator(value),
                          hintText: StringConstants.form_name_hint,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(height: ConstantSizes.large.value),
                      FadeInUp(
                        child: CustomTextFormField(
                          controller: mailController,
                          validator: (value) =>
                              AppValidators.emailValidator(value),
                          hintText: StringConstants.form_mail_hint,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(height: ConstantSizes.large.value),
                      FadeInUp(
                        child: CustomTextFormField(
                          controller: msgController,
                          validator: (value) =>
                              AppValidators.messageValidator(value),
                          hintText: StringConstants.form_msg_hint,
                          maxLines: 16,
                        ),
                      ),
                      SizedBox(height: ConstantSizes.large.value),
                      FadeInUp(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.tertiaryFixed,
                            fixedSize: const Size(150, 40),
                          ),
                          onPressed: () async {
                            await sendMessageButton();
                          },
                          child: isLoading
                              ? Padding(
                                  padding: context.cPaddingSmall / 2,
                                  child: CircularProgressIndicator(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                )
                              : Text(
                                  StringConstants.form_send_button,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                ),
                        ),
                      ),
                      SizedBox(height: ConstantSizes.large.value),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LeftSide extends StatelessWidget {
  const _LeftSide();

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          ImageEnumsPng.bg_form.toPathPng,
          fit: BoxFit.cover,
        ),
        Container(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: ConstantSizes.xxLarge.value,
            right: ConstantSizes.xxLarge.value,
          ),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: ConstantSizes.xxLarge.value),
                FadeInLeft(
                  child: Image.asset(
                    ImageEnumsPng.logo.toPathPng,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: ConstantSizes.medium.value),
                FadeInRight(
                  child: Text(
                    textAlign: TextAlign.center,
                    StringConstants.contact_us_title,
                    style: !isTablet
                        ? Theme.of(context).textTheme.displayMedium?.copyWith(
                              shadows: CustomShadows.customLowShadow(context),
                            )
                        : Theme.of(context).textTheme.titleMedium?.copyWith(
                              shadows: CustomShadows.customLowShadow(context),
                            ),
                  ),
                ),
                SizedBox(height: ConstantSizes.medium.value),
                FadeInLeft(
                  child: Text(
                    textAlign: TextAlign.center,
                    StringConstants.contact_us_description,
                    style: !isTablet
                        ? Theme.of(context).textTheme.titleLarge?.copyWith(
                              shadows: CustomShadows.customLowShadow(context),
                            )
                        : Theme.of(context).textTheme.bodyLarge?.copyWith(
                              shadows: CustomShadows.customLowShadow(context),
                            ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
