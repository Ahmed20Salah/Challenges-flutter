import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class DateTimePicker {

  static Future<List<DateTime>?> datePicker({
    required BuildContext context,
    DateTime? startInitialDate,
    DateTime? endInitialDate,
  }) async {
    List<DateTime>? dateTimeList = await showOmniDateTimeRangePicker(
      context: context,
      // theme: ThemeData(
      //   primaryColor: Colors.cyan,
      //   calendarTextColor: Colors.black,
      //   tabTextColor: Colors.black,
      //   unselectedTabBackgroundColor: Colors.grey[700],
      //   buttonTextColor: Colors.black,
      //   timeSpinnerTextStyle:
      //       const TextStyle(color: Colors.black26, fontSize: 18),
      //   timeSpinnerHighlightedTextStyle:
      //       const TextStyle(color: Colors.black, fontSize: 24), colorScheme: ColorScheme(background: Colors.white),
      // ),
      is24HourMode: false,
      isShowSeconds: false,
      startInitialDate: startInitialDate ?? DateTime.now(),
      startFirstDate: DateTime(1600).subtract(const Duration(days: 3652)),
      startLastDate: DateTime.now().add(const Duration(days: 3652)),
      endInitialDate: endInitialDate ?? DateTime.now(),
      endFirstDate: DateTime(1600).subtract(const Duration(days: 3652)),
      endLastDate: DateTime.now().add(const Duration(days: 3652)),
      borderRadius:  BorderRadius.circular(16),
    );
    log('$dateTimeList');
    return dateTimeList;
  }
}
