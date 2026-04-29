import 'package:intl/intl.dart';

extension TimeAgo on DateTime {
  String timeAgo() {
    final diff = DateTime.now().difference(this);
    if (diff.inDays > 365) {
      return "${(diff.inDays / 365).floor()}y ago";
    }
    if (diff.inDays > 30) {
      return "${(diff.inDays / 30).floor()}m ago";
    }
    if (diff.inDays > 7) {
      return "${(diff.inDays / 7).floor()}w ago";
    }
    if (diff.inDays > 0) {
      return "${diff.inDays}d ago";
    }
    if (diff.inHours > 0) {
      return "${diff.inHours}h ago";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes}m ago";
    }
    return "Just now";
  }

  String toShortDate() {
    return DateFormat('dd MMM yyyy').format(this);
  }
}
