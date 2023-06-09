import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.textColor,
    required this.buttonText,
    required this.buttonColor,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.isSubmitting,
    required this.isOutlined,
    this.buttonIcon,
    this.buttonAction,
    this.borderRadius = 30.0,
  }) : super(key: key);

  final String? buttonText;
  final Color buttonColor;
  final Color textColor;

  final double buttonWidth;
  final double buttonHeight;
  final bool isSubmitting;
  final bool isOutlined;
  final Function? buttonAction;
  final IconData? buttonIcon;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton.icon(
        onPressed: () => buttonAction?.call(),
        icon: buttonIcon != null
            ? SizedBox(
                child: Icon(
                  buttonIcon,
                  color: isOutlined ? buttonColor : Colors.white,
                  size: buttonHeight * .3,
                ),
              )
            : const SizedBox(),
        label: !isSubmitting
            ? Text(
                buttonText!,
                style: TextStyle(
                  color: isOutlined ? buttonColor : textColor,
                  fontSize: 16,
                ),
              )
            : const CircularProgressIndicator.adaptive(),
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined
              ? Theme.of(context).colorScheme.background
              : buttonColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          side: isOutlined ? BorderSide(color: buttonColor, width: 2.0) : null,
        ),
      ),
    );
  }
}
