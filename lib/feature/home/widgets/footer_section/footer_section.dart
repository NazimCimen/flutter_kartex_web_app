import 'package:flutter/material.dart';
import 'package:kartex_web/core/size/constant_size.dart';
import 'package:kartex_web/feature/contact_us/presentation/view/contact_info_view.dart';
import 'package:kartex_web/feature/contact_us/presentation/widget/google_map_widget.dart';
import 'package:kartex_web/responsive/responsive.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ConstantSizes.largePageHeight.value,
      width: Responsive.getWidth(context),
      child: Column(
        children: [
          SizedBox(height: ConstantSizes.large.value * 5 / 2),
          const Expanded(
            child: _BodyContent(),
          ),
        ],
      ),
    );
  }
}

class _BodyContent extends StatefulWidget {
  const _BodyContent();

  @override
  State<_BodyContent> createState() => _BodyContentState();
}

class _BodyContentState extends State<_BodyContent> {
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Row(
      children: [
        if (!isMobile) const Expanded(child: GoogleMapWidget()),
        const Expanded(child: ContactInfoView()),
      ],
    );
  }
}
