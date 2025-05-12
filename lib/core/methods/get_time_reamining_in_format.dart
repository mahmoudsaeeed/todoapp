/// ! Function used in TaskTileTimeWidget file
String getTimeRemainingInFormat(String? dueDateString) {
  if (dueDateString == null || dueDateString.isEmpty) {
    return '';  // ترجع قيمة فارغة ولا يظهر أي شيء
  }
/// * convert String date to DateTime object
  DateTime dueDate = DateTime.parse(dueDateString);

  DateTime currentTime = DateTime.now();

// * calc the difference between to dates
  Duration difference = dueDate.difference(currentTime);

  if (difference.isNegative) {
    return '';  /// * if Date in the past don't do anything
  } else {

    if (difference.inDays >= 7 && difference.inDays < 30) {
      // أقل من 4 أسابيع
      int weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks > 1 ? 'W' : ''}';
    } else if (difference.inDays >= 1) {
      // أقل من 7 أيام
      return '${difference.inDays} ${difference.inDays > 1 ? 'D' : ''}';
    } else if (difference.inHours >= 1) {
      // أقل من 24 ساعة
      return '${difference.inHours} ${difference.inHours > 1 ? 'H' : ''}';
    } else if (difference.inMinutes >= 1) {
      // أقل من 60 دقيقة
      return '${difference.inMinutes} ${difference.inMinutes > 1 ? 'M' : ''}';
    } else {
      // أقل من دقيقة
      return '${difference.inSeconds} ${difference.inSeconds > 1 ? 'S' : ''}';
    }
  }
}

