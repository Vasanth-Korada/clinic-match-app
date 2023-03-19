import 'package:clinic_match_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final int? maxLines;
  final bool obscureText;
  final String? hintText;
  final String? label;
  final String? errorText;
  final String? helperText;
  final Widget? suffixIcon;
  final Widget? suffix;
  final VoidCallback? onSuffixPressed;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final Color? helperTextColor;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final bool enabled;
  final bool autoFocus;
  final bool autoCorrect;
  final TextInputType? inputType;
  final Color? fillColor;
  final Color? cursorColor;
  final Color? underlineBorderColor;
  final TextCapitalization textCapitalization;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final InputBorder? disabledBorder;
  final TextAlign textAlign;
  final String counterText;
  final Iterable<String>? autofillHints;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.label,
    this.suffixIcon,
    this.suffix,
    this.controller,
    this.obscureText = false,
    this.maxLines = 1,
    this.onChanged,
    this.errorText,
    this.helperText,
    this.helperTextColor,
    this.onSuffixPressed,
    this.onSubmitted,
    this.textInputAction,
    this.maxLength,
    this.inputType = TextInputType.text,
    this.enabled = true,
    this.autoFocus = false,
    this.autoCorrect = true,
    this.fillColor = AppColors.darkBlue,
    this.cursorColor = AppColors.multiplYellow,
    this.underlineBorderColor,
    this.textCapitalization = TextCapitalization.sentences,
    this.textStyle,
    this.hintTextStyle,
    this.disabledBorder,
    this.textAlign = TextAlign.start,
    this.counterText = '',
    this.autofillHints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...{
          Text(label!, style: Theme.of(context).textTheme.subtitle1),
        },
        TextField(
          enabled: enabled,
          onChanged: onChanged,
          controller: controller,
          onSubmitted: onSubmitted,
          textInputAction: textInputAction,
          maxLines: maxLines,
          maxLength: maxLength,
          autofocus: autoFocus,
          autocorrect: autoCorrect,
          autofillHints: enabled ? autofillHints : null,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          obscureText: obscureText,
          cursorColor: cursorColor,
          keyboardType: inputType,
          showCursor: true,
          textAlign: textAlign,
          textCapitalization: textCapitalization,
          style: textStyle ?? Theme.of(context).textTheme.subtitle1,
          decoration: InputDecoration(
            hintText: hintText,
            counterText: counterText,
            hintStyle: hintTextStyle ??
                Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: AppColors.white60),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color:
                underlineBorderColor ?? Theme.of(context).primaryColorDark,
              ),
            ),
            suffix: suffix,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color:
                underlineBorderColor ?? Theme.of(context).primaryColorDark,
              ),
            ),
            disabledBorder: disabledBorder ??
                UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.87),
                  ),
                ),
            suffixIcon: suffixIcon != null
                ? IconButton(
              icon: suffixIcon!,
              onPressed: onSuffixPressed,
            )
                : null,
            filled: fillColor != null,
            fillColor: fillColor,
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            errorText: errorText,
            helperText: helperText,
            helperStyle: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: helperTextColor ?? AppColors.navyBlue),
            errorStyle: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: Theme.of(context).errorColor),
          ),
        ),
      ],
    );
  }
}
