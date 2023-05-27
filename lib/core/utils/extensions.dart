import 'package:intl/intl.dart';

extension IntCaseConverter on int {
  String compactNumber() {
    return NumberFormat.compact().format(this);
  }
}

extension DateCaseConverter on DateTime {
  String toTimeAgoLabel() {
    final now = DateTime.now();
    final durationSinceNow = now.difference(this);

    final inDays = durationSinceNow.inDays;
    final inHours = durationSinceNow.inDays;
    final inMinutes = durationSinceNow.inMinutes;
    final inSeconds = durationSinceNow.inSeconds;
    final df = DateFormat(DateFormat.ABBR_MONTH);

    if (inDays > 30) {
      return '${this.day}. ${df.format(this)}. ${this.year}';
    }
    if (inDays >= 1) {
      return '$inDays days ago';
    }

    if (inHours >= 1) {
      return '$inHours hours ago';
    }

    if (inMinutes >= 2) {
      return '$inMinutes minutes ago';
    }

    return '$inSeconds seconds ago';
  }
}
