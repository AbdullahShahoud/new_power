import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/localization/app_localizations.dart';

part 'localized.freezed.dart';
part 'localized.g.dart';

/// catalog-mobile-integration.md §8.1 — the bilingual primitive. Every
/// catalogue response carries **both** languages always; there is no locale
/// parameter anywhere in the module, so the client picks.
///
/// `ar` is `NOT NULL` in the schema and is never absent. `en` **is**
/// nullable and must stay so — the seed backfilled English from Arabic, but
/// an admin can clear an English field at any time (6 products already have
/// no English name). An empty string is normalised to `null` server-side, so
/// there is exactly one absence to check for.
@freezed
abstract class Localized with _$Localized {
  const factory Localized({String? en, required String ar}) = _Localized;

  factory Localized.fromJson(Map<String, dynamic> json) =>
      _$LocalizedFromJson(json);
}

extension LocalizedX on Localized {
  /// §8.1's Dart contract. Arabic is always safe; **English must fall back
  /// to Arabic**, never to an empty string.
  String resolve(BuildContext context) =>
      AppLocalizations.of(context).isArabic ? ar : (en ?? ar);
}

extension NullableLocalizedX on Localized? {
  String resolveOr(BuildContext context, String fallback) =>
      this == null ? fallback : this!.resolve(context);
}
