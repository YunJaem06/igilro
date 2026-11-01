import 'package:flutter/material.dart';

String formatRemainingTime(Duration value) {
  if (value < const Duration(minutes: 1)) return '1분 미만';
  final minutes = (value.inSeconds / 60).ceil();
  if (minutes < 60) return '$minutes분';
  final hours = minutes ~/ 60, rest = minutes % 60;
  return rest == 0 ? '$hours시간' : '$hours시간 $rest분';
}

String formatGuidanceElapsed(Duration value) {
  final seconds = value.inSeconds;
  if (seconds < 60) return '$seconds초';
  final minutes = seconds ~/ 60;
  final rest = seconds % 60;
  final prefix = minutes < 60
      ? '$minutes분'
      : '${minutes ~/ 60}시간 ${minutes % 60}분';
  return rest == 0 ? prefix : '$prefix $rest초';
}

String formatNavigationTime(
  BuildContext context,
  DateTime instant, {
  DateTime? reference,
  bool includeDate = false,
}) {
  final local = instant.toLocal();
  var day = '';
  if (includeDate) {
    day = '${local.year}년 ${local.month}월 ${local.day}일 ';
  } else if (reference != null) {
    final from = reference.toLocal();
    final days = DateTime.utc(
      local.year,
      local.month,
      local.day,
    ).difference(DateTime.utc(from.year, from.month, from.day)).inDays;
    if (days == 1) {
      day = '내일 ';
    } else if (days != 0) {
      day =
          '${local.year != from.year ? '${local.year}년 ' : ''}${local.month}월 ${local.day}일 ';
    }
  }
  return day +
      MaterialLocalizations.of(context).formatTimeOfDay(
        TimeOfDay.fromDateTime(local),
        alwaysUse24HourFormat: MediaQuery.alwaysUse24HourFormatOf(context),
      );
}

String formatNavigationDistance(double meters) => meters >= 1000
    ? '${(meters / 1000).toStringAsFixed(1)}km'
    : '${meters.round()}m';
