import 'package:intl/intl.dart';

class ConvertUtility {
  static final DateFormat _calendarFormat = DateFormat('dd MMMM yyyy');

  static String calendarFormat(DateTime date) {
    return _calendarFormat.format(date);
  }

  String formatDateTimeFromUtc(dynamic time) {
    try {
      return new DateFormat("yyyy-MM-dd hh:mm:ss")
          .format(new DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(time));
    } catch (e) {
      return new DateFormat("yyyy-MM-dd hh:mm:ss").format(new DateTime.now());
    }
  }

  static String convertDateTimeToString(DateTime dateTime){
      return _calendarFormat.format(dateTime);
  }

  static DateTime? parseDateTime(String? json) {
    if (json == null || json.isEmpty) {
      return null;
    }
    return DateTime.parse(json + 'Z').toLocal();
  }
  static String convertStringUTCToStringCalendarDate(String date){
    DateTime dateTime = DateTime.parse(date);

    return _calendarFormat.format(dateTime);
  }
}
