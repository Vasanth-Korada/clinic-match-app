import 'package:clinic_match_app/common/widgets/buttons/cm_gradient_button.dart';
import 'package:clinic_match_app/constants/strings.dart';
import 'package:clinic_match_app/core/navigation/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CMDatePickerDialog extends StatefulWidget {
  static const defaultInitialDate = 1990;
  static const defaultMinDate = 1900;
  final ValueChanged<DateTime?>? onDateSelected;
  final DateTime? initialDate;
  final DateTime? maxDate;
  final DateTime? minDate;

  const CMDatePickerDialog({
    super.key,
    this.onDateSelected,
    this.initialDate,
    this.maxDate,
    this.minDate,
  });

  @override
  State<StatefulWidget> createState() => _CMDatePickerDialogState();
}

class _CMDatePickerDialogState extends State<CMDatePickerDialog> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate ?? DateTime(CMDatePickerDialog.defaultInitialDate);
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (_) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.30,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (value) => selectedDate = value,
                maximumDate: widget.maxDate ?? DateTime.now(),
                initialDateTime: widget.initialDate ?? DateTime(CMDatePickerDialog.defaultInitialDate),
                minimumDate: widget.minDate ?? DateTime(CMDatePickerDialog.defaultMinDate),
              ),
            ),
            CMGradientButton(
              buttonText: AppStrings.ok,
              onTap: () {
                widget.onDateSelected?.call(selectedDate);
                navService.pop();
              },
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
