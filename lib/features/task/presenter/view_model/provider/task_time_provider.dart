import 'dart:async';
import 'package:flutter/material.dart';

class TaskTimeProvider with ChangeNotifier {
  String? dueDateString;
  String? remainingTime;
  Timer? _timer;

  TaskTimeProvider({this.dueDateString}) {
    _startTimerIfNeeded();
  }

  /// * if time is null or became in the past it will return null
  ///  * else it will return DateTime
  void setDueDate(String? newDueDateString) {
    dueDateString = newDueDateString;
    _startTimerIfNeeded();
  }

  void _startTimerIfNeeded() {
    _timer?.cancel(); // إلغاء أي تايمر قديم

    final dueDate = _parseDueDate();
    if (dueDate == null || dueDate.isBefore(DateTime.now())) {
      remainingTime = null;
      notifyListeners();
      return; // لا تعمل listen ولا تايمر
    }

    // أول تحديث فوري
    _updateRemainingTime();

    // اختيار الفترة الزمنية
    Duration interval = _getInterval(dueDate);

    _timer = Timer.periodic(interval, (_) {
      final now = DateTime.now();
      if (dueDate.isBefore(now)) {
        remainingTime = null;
        notifyListeners();
        _timer?.cancel();
        return;
      }

      _updateRemainingTime();

      // لو غيرنا الفترة الزمنية (من دقائق لثواني)، نعيد تشغيل التايمر
      Duration newInterval = _getInterval(dueDate);
      if (newInterval != interval) {
        _startTimerIfNeeded();
      }
    });
  }

  Duration _getInterval(DateTime dueDate) {
    final diff = dueDate.difference(DateTime.now());
    return diff.inMinutes < 1
        ? const Duration(seconds: 1)
        : const Duration(minutes: 1);
  }

  void _updateRemainingTime() {
    final dueDate = _parseDueDate();
    if (dueDate == null) {
      remainingTime = null;
      notifyListeners();
      return;
    }
/// * add duration 1 day to see the current day
    Duration difference =
        dueDate.difference(DateTime.now());
    if (difference.isNegative) {
  remainingTime = null;
} else if (difference.inDays >= 7 && difference.inDays < 30) {
  int weeks = (difference.inDays / 7).floor();
  remainingTime = '$weeks W';
} else if (difference.inHours >= 24) {
  remainingTime = '${difference.inDays} D';
} else if (difference.inHours >= 1) {
  remainingTime = '${difference.inHours} H';
} else if (difference.inMinutes >= 1) {
  remainingTime = '${difference.inMinutes} M';
} else {
  remainingTime = '${difference.inSeconds} S';
}

    notifyListeners();
  }

  DateTime? _parseDueDate() {
  if (dueDateString == null) return null;
  final parsed = DateTime.tryParse(dueDateString!);
  if (parsed == null) return null;

  // نحوله ليكون الساعة 12 منتصف الليل لليوم التالي
  return DateTime(parsed.year, parsed.month, parsed.day + 1);
}


  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
