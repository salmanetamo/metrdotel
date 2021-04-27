enum DayOfWeek{
  MONDAY,
  TUESDAY,
  WEDNESDAY,
  THURSDAY,
  FRIDAY,
  SATURDAY,
  SUNDAY,
  _fromString
}

extension DayOfWeekExtension on DayOfWeek {
  static const map = const {
    DayOfWeek.MONDAY: "MONDAY",
    DayOfWeek.TUESDAY: "TUESDAY",
    DayOfWeek.WEDNESDAY: "WEDNESDAY",
    DayOfWeek.THURSDAY: "THURSDAY",
    DayOfWeek.FRIDAY: "FRIDAY",
    DayOfWeek.SATURDAY: "SATURDAY",
    DayOfWeek.SUNDAY: "SUNDAY",
  };

  String get value => map[this];

  operator[](String key) =>
      DayOfWeek.values.firstWhere((e) => e.toString() == 'DayOfWeek.' + key);
}