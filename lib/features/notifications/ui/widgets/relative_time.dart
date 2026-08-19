import 'package:flutter/widgets.dart';

import '../../../../core/localization/app_localizations.dart';

/// Arabic-aware relative time, e.g. `منذ ٣ ساعات` — with the **dual** and
/// both plural forms Arabic actually needs.
///
/// A naive `منذ $n دقيقة` is wrong for almost every small number:
///
/// | n | correct Arabic | naive output |
/// | --- | --- | --- |
/// | 1 | منذ دقيقة | منذ ١ دقيقة |
/// | 2 | منذ دقيقتين | منذ ٢ دقيقة |
/// | 3–10 | منذ ٣ دقائق | منذ ٣ دقيقة |
/// | 11+ | منذ ١١ دقيقة | (coincidentally right) |
///
/// So Arabic needs four buckets per unit, not one. English needs two.
/// Beyond a week both fall back to an absolute date — "منذ ٣ أسابيع" is
/// less useful than the day it happened.
///
/// Digits stay Western throughout, consistent with the rest of the app.
class RelativeTime {
  RelativeTime._();

  static const _weekCutoff = Duration(days: 7);

  static String format(BuildContext context, DateTime when) {
    final delta = DateTime.now().difference(when);

    if (delta >= _weekCutoff || delta.isNegative) {
      return _absolute(context, when);
    }
    if (delta.inMinutes < 1) return context.tr('time_just_now');

    if (delta.inHours < 1) {
      return _plural(context, delta.inMinutes, 'minute');
    }
    if (delta.inDays < 1) {
      return _plural(context, delta.inHours, 'hour');
    }
    return _plural(context, delta.inDays, 'day');
  }

  /// Picks the grammatical form, then fills the count.
  ///
  /// The bucket names are shared by both locales; English simply maps
  /// `two`/`few` onto the same plural string, so one call site serves both
  /// without the caller knowing which language is active.
  static String _plural(BuildContext context, int count, String unit) {
    final String bucket;
    if (count == 1) {
      bucket = 'one';
    } else if (count == 2) {
      bucket = 'two';
    } else if (count <= 10) {
      bucket = 'few';
    } else {
      bucket = 'many';
    }
    return context.tr('time_${unit}_$bucket').replaceAll('{count}', '$count');
  }

  /// Past a week the exact day is more use than a vague distance.
  static String _absolute(BuildContext context, DateTime when) {
    final local = when.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${local.year}-${two(local.month)}-${two(local.day)} '
        '${two(local.hour)}:${two(local.minute)}';
  }

  /// The full timestamp, for a semantics label — a screen reader announcing
  /// "منذ ٣ ساعات" alone leaves a blind user unable to know *when*.
  static String absoluteForSemantics(BuildContext context, DateTime when) =>
      _absolute(context, when);
}
