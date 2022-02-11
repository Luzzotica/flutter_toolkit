import 'package:flutter/material.dart';
import 'package:flutter_toolkit/resources/app_colors.dart';
import 'package:flutter_toolkit/resources/app_styles.dart';
import 'package:flutter_toolkit/util/constants.dart';

class Button extends StatelessWidget {
  const Button(
    this.text,
    this.onPressed, {
    Key? key,
    this.primary = true,
    this.minWidth = double.infinity,
  }) : super(key: key);

  final String text;
  final Function onPressed;
  final bool primary;
  final double minWidth;

  @override
  Widget build(BuildContext context) {
    MaterialButton button;
    if (primary) {
      button = MaterialButton(
        height: 50,
        minWidth: minWidth,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.buttonRadius),
          side: const BorderSide(color: AppColors.buttonColorPrimary, width: 2),
        ),
        child: Text(
          text,
          style: AppStyles.getButtonStyle(primary: primary),
        ),
        onPressed: onPressed(),
      );
    } else {
      button = MaterialButton(
        height: 50,
        minWidth: double.infinity,
        color: AppColors.buttonColorSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.buttonRadius),
        ),
        child: Text(
          text,
          style: AppStyles.getButtonStyle(primary: primary),
        ),
        onPressed: onPressed(),
      );
    }

    return Container(
      padding: const EdgeInsets.all(9),
      child: button,
    );
  }
}
