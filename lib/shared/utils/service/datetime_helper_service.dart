import 'package:metrdotel/shared/utils/model/day_of_week.dart';

class DateTimeHelperService {
  static DayOfWeek getDayOfWeekFromIndex(int index) {
    return DayOfWeek.values[index - 1];
  }
}