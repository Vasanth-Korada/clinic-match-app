import 'package:clinic_match_app/constants/assets.dart';
import 'package:clinic_match_app/constants/colors.dart';
import 'package:clinic_match_app/core/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///
/// A Wrapper of the default [AppBar] that extends [PreferredSize]
/// that follows the UI,
/// guideline of the Multipl App design UI/UX.
///
/// Use this [CMAppBar] instead of normal app bar wherever possible.
///
class CMAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// A string that will be set the the [Text] widget.
  final String? title;

  /// Default to true, setting it true will navigate to the previous stack.
  final bool navigateBack;

  /// Sets up a background color of the [AppBar]
  /// Default value set to the [AppColors.darkBlue].
  final Color backgroundColor;

  /// Sets up a title text color of the [AppBar]
  /// Default value set to the [AppColors.white87].
  final Color titleTextColor;

  /// Sets up a navigate Back text color of the [AppBar]
  /// Default value set to the [AppColors.white].
  final Color backIconColor;

  // Triggered when back button is tapped. Defaults to pop()
  final VoidCallback? onBack;

  /// Widgets to display in a row after the [title] widget.
  final List<Widget>? actions;

  final PreferredSizeWidget? bottom;
  final Widget? backIcon;

  const CMAppBar({
    super.key,
    this.title,
    this.navigateBack = true,
    this.backgroundColor = AppColors.darkBlue,
    this.actions,
    this.titleTextColor = AppColors.white87,
    this.backIconColor = AppColors.white,
    this.bottom,
    this.onBack,
    this.backIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      leading: navigateBack
          ? IconButton(
              onPressed: () {
                if (onBack != null) {
                  onBack!();
                } else {
                  navService.pop();
                }
              },
              icon: backIcon ?? SvgPicture.asset(Svgs.icBackWhite, color: backIconColor),
            )
          : Container(),
      actions: actions,
      bottom: bottom,
      title: title != null
          ? Text(
              title!,
              overflow: TextOverflow.fade,
              style: Theme.of(context).textTheme.headline6!.copyWith(color: titleTextColor),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48.0);
}
