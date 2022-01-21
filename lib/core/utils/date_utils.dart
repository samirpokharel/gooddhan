import 'package:intl/intl.dart';
import 'package:nepali_utils/nepali_utils.dart';

enum DateFormatOption { nepali, english }

class AppDateUtils {
  static final DateFormat _englishDateFormat = DateFormat.yMMMd('en_US');
  static final NepaliDateFormat _nepaliDateFormat =
      NepaliDateFormat('yyyy-MM-dd');

  static String format(
    DateTime dateTime, {
    DateFormatOption dateFormatOption = DateFormatOption.english,
  }) {
    if (dateFormatOption == DateFormatOption.english) {
      return _englishDateFormat.format(dateTime);
    } else {
      return _nepaliDateFormat.format(dateTime.toNepaliDateTime());
    }
  }
}
