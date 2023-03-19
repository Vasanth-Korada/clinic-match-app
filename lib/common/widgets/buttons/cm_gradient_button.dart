import 'package:clinic_match_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CMGradientButton extends StatelessWidget {
  final String buttonText;
  final TextStyle? buttonTextStyle;
  final Gradient? gradient;
  final GestureTapCallback? onTap;
  final Color? shadowColor;
  final Color? textColor;
  final bool showLoader;
  final bool enabled;
  final BorderRadius borderRadius;
  final Widget? icon;

  const CMGradientButton({
    Key? key,
    required this.buttonText,
    this.showLoader = false,
    this.enabled = true,
    this.buttonTextStyle,
    Color? textColor,
    Gradient? gradient,
    this.onTap,
    this.shadowColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
  })  : icon = null,
        textColor = textColor ?? (enabled
            ? AppColors.darkBlue
            : AppColors.multiplYellow),
        gradient = enabled
            ? gradient ?? AppColors.buttonLinearGradient
            : AppColors.buttonDisabledGradient,
        super(key: key);

  const CMGradientButton.withTrailingIcon({
    Key? key,
    required this.icon,
    required this.buttonText,
    Color? textColor,
    this.showLoader = false,
    this.enabled = true,
    this.buttonTextStyle,
    Gradient? gradient,
    this.onTap,
    this.shadowColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(24)),
  })  : gradient = enabled
      ? gradient ?? AppColors.buttonLinearGradient
      : AppColors.buttonDisabledGradient,
        textColor = enabled ? AppColors.darkBlue : AppColors.multiplYellow,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      constraints: BoxConstraints.tightFor(
        height: 42,
        width: showLoader ? 42 : 160,
      ),
      child: Material(
        borderRadius: borderRadius,
        child: Ink(
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: borderRadius,
          ),
          child: InkWell(
            onTap: enabled && !showLoader ? _triggerOnTap : null,
            borderRadius: borderRadius,
            child: showLoader
                ? const Center(
              child: SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.darkBlue,
                  ),
                ),
              ),
            )
                : Center(
              child: RichText(
                text: TextSpan(
                  text: buttonText,
                  style: (buttonTextStyle ??
                      Theme.of(context).textTheme.button?.copyWith(
                        fontWeight: FontWeight.w500,
                      ))
                      ?.copyWith(
                    color: enabled ? textColor : AppColors.black,
                  ),
                  children: [
                    if (icon != null) ...{
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: icon,
                        ),
                      )
                    }
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _triggerOnTap() {
    HapticFeedback.lightImpact();
    onTap?.call();
  }
}
