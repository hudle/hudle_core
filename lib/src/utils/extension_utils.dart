extension ValidationErrorValue on List<String>? {

  String? get errorValue => (this?.length ?? 0) > 0 ? this![0] : null;
}

extension EmptyOrNullString on String? {

  String orPlaceEmpty({String placeValue = "--"}) => this?.isEmpty == true ? placeValue : this ?? placeValue;

  String get capitalize => this == null ? ""  :  (this?.isNotEmpty ?? false) ? this!.substring(0, 1).toUpperCase() + this!.substring(1) : this ?? "";
}


extension DateTimeExt on DateTime {
  String get getWeekDays  {
    print(weekday);
    switch(this.weekday) {
      case 1: return "Monday";
      case 2: return "Tuesday";
      case 3: return "Wednesday";
      case 4: return "Thursday";
      case 5: return "Friday";
      case 6: return "Saturday";
      case 7: return "Sunday";
      default: return "N/A $weekday";
    }
  }
}

extension NullBoolean on bool? {
    bool get orFalse => this ?? false;

    bool get orTrue => this ?? true;

    String get toStringBool => this.orFalse ? "1" : "0";

    String? toStringBoolWithOption({String? trueValue = "1", String? falseValue = ""}) => this.orFalse ? trueValue : falseValue;
}

extension IntExt on int {

  String get digitSuffix  {
    final number = this;
    final num =  (number < 20) ? number : number % 10;
    switch(num) {
      case 1: return "st";
      case 2: return "nd";
      case 3: return "rd";
    }
    return "th";
  }
}