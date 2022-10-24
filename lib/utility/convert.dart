import 'package:intl/intl.dart';

class ConvertUtility {
  static final DateFormat _calendarFormat = DateFormat('dd MMMM yyyy');

  static String calendarFormat(DateTime date) {
    return _calendarFormat.format(date);
  }

  // String formatDateTimeFromUtc(DateTime time) {
  //   try {
  //     return DateFormat("yyyy-MM-dd hh:mm:ss")
  //         .format(DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(time??DateTime.now()));
  //   } catch (e) {
  //     return DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now());
  //   }
  // }

  // static String convertDateTimeToString(DateTime dateTime){
  //     return _calendarFormat.format(dateTime);
  //
  // }

  static DateTime? convertStringToDateTime(String? json) {
    if (json == null || json.isEmpty) {
      return null;
    }
    return DateTime.parse(json).toLocal();
  }


  @override
  static String? convertDatetimeToString(DateTime? json) => json?.toUtc().toIso8601String();

  static DateTime? parseStringToDateTime(String? stringDate) {
    if (stringDate == null || stringDate.isEmpty) {
      return null;
    }
    return DateTime.parse(stringDate).toLocal();
  }
  static String convertStringUTCToStringCalendarDate(String date){
    DateTime dateTime = DateTime.parse(date);

    return _calendarFormat.format(dateTime);
  }
}
