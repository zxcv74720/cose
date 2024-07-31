String formatTimeAgo(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  DateTime now = DateTime.now();
  Duration difference = now.difference(dateTime);

  if (difference.inMinutes < 1) {
    return "방금 전";
  } else if (difference.inMinutes < 60) {
    return "${difference.inMinutes}분 전";
  } else if (difference.inHours < 24) {
    return "${difference.inHours}시간 전";
  } else if (difference.inDays < 30) {
    return "${difference.inDays}일 전";
  } else {
    int months = (difference.inDays / 30).floor();
    if (months < 12) {
      return "${months}개월 전";
    } else {
      int years = (months / 12).floor();
      return "${years}년 전";
    }
  }
}


