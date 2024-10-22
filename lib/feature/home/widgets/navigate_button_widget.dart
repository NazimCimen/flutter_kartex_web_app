import 'package:flutter/material.dart';
import 'package:kartex_web/core/size/app_border_radius_extensions.dart';
import 'package:kartex_web/core/size/padding_extension.dart';

class NavigateButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  const NavigateButtonWidget({
    required this.onPress,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: context.cPaddingMedium,
        backgroundColor: Colors.transparent,
        shape: ContinuousRectangleBorder(
          borderRadius: context.borderRadiusAllLow,
          side: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.tertiaryFixed,
          ),
        ),
      ),
      onPressed: onPress,
      child: FittedBox(
        child: Text(
          maxLines: 1,
          text,
          style: TextStyle(
            fontSize: 30,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
