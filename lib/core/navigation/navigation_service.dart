import 'dart:async';
import 'dart:ui';
import 'package:clinic_match_app/common/widgets/dialogs/cm_date_picker_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final NavigationService navService = NavigationService();
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class NavigationService<T, U> {
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  Future<T?> pushNamed(String routeName, {Object? args}) async {
    return await navigationKey.currentState?.pushNamed<T>(
      routeName,
      arguments: args,
    );
  }

  Future<T?> push(Route<T> route) async {
    return await navigationKey.currentState?.push<T>(route);
  }

  Future<T?> pushReplacement<T, U>(Route<T> route, {Object? result}) async {
    return await navigationKey.currentState?.pushReplacement<T, U>(route, result: result as U?);
  }

  Future<T?> pushAndRemoveUntil(Route<T> route, RoutePredicate removeUntil) async {
    return await navigationKey.currentState?.pushAndRemoveUntil(route, removeUntil);
  }

  Future<bool> maybePop([Object? args]) async {
    return await navigationKey.currentState?.maybePop<bool>(args as bool?) ?? false;
  }

  bool canPop() => navigationKey.currentState?.canPop() ?? false;

  void pop({Object? result}) => navigationKey.currentState?.pop(result);

  void popAll({Object? result}) => navigationKey.currentState?.popUntil(ModalRoute.withName("/"));

  void popUntil({required String routeName}) => navigationKey.currentState?.popUntil(ModalRoute.withName(routeName));

  Future<T?> popAllAndPush(Route<T> route) async {
    return navigationKey.currentState?.pushAndRemoveUntil(
      route,
      ModalRoute.withName("/"),
    );
  }

  Future<T?> showBottomSheet<T>(
    Widget bottomSheet, {
    bool isScrollControlled = false,
    bool isDismissible = true,
    Color bgColour = Colors.transparent,
  }) =>
      showModalBottomSheet<T>(
        backgroundColor: bgColour,
        context: navigationKey.currentContext!,
        isScrollControlled: isScrollControlled,
        isDismissible: isDismissible,
        builder: (_) => bottomSheet,
      );

  Future<T?> showDialog<T>({
    String? barrierLabel,
    bool barrierDismissible = true,
    Color? barrierColor,
    required Widget widget,
    RouteTransitionsBuilder? transitionBuilder,
  }) {
    return showGeneralDialog<T>(
      barrierLabel: barrierLabel ?? 'GeneralDialog',
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor ?? Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      context: navigationKey.currentContext!,
      pageBuilder: (context, anim1, anim2) => widget,
      transitionBuilder: transitionBuilder ??
          (context, anim1, anim2, child) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: SlideTransition(
                position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
                child: child,
              ),
            );
          },
    );
  }

  Future<DateTime> showDatePicker({
    DateTime? maxDate,
    DateTime? minDate,
    DateTime? initialDate,
  }) async {
    final dateCompleter = Completer<DateTime>();
    await showCupertinoModalPopup(
      context: navigationKey.currentContext!,
      builder: (context) => SafeArea(
        child: CMDatePickerDialog(
          initialDate: initialDate,
          maxDate: maxDate,
          minDate: minDate,
          onDateSelected: (date) => dateCompleter.complete(date),
        ),
      ),
    );
    return dateCompleter.future;
  }
}
