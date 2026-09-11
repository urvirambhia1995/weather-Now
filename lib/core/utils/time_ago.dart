String timeAgoSinceDate(DateTime date) {
  final now = DateTime.now();
  final diff = now.difference(date);
  if (diff.inMinutes < 60) {
    return '${diff.inMinutes}m ago';
  } else if (diff.inHours < 24) {
    return '${diff.inHours}h ago';
  } else {
    return '${diff.inDays}d ago';
  }
}
