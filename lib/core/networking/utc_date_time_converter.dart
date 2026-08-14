import 'package:json_annotation/json_annotation.dart';

/// Makes the wire format unambiguously UTC and the in-app format reliably
/// local, in one place.
///
/// **The bug this fixes.** json_serializable's default is
/// `instance.field.toIso8601String()`. On a *local* `DateTime` — which is
/// exactly what `showDatePicker`/`showTimePicker` and `DateTime.now()`
/// return — that emits `2026-08-09T18:46:14.289`: no `Z`, no `+03:00`, no
/// offset of any kind. A server reading an offset-less timestamp treats it
/// as UTC, so a visit logged at 18:46 local is stored as 18:46 UTC and
/// reads back three hours wrong. The reverse leg had the mirror problem:
/// `DateTime.parse('…Z')` yields a UTC `DateTime`, and any widget that
/// formatted it without `.toLocal()` displayed 15:46 for an 18:46 event.
///
/// **The invariant.** Everything crossing the network is UTC with an
/// explicit `Z`; every `DateTime` held in Dart is local. Widgets can then
/// format directly with no timezone thought at all, and the app is correct
/// in any timezone the rep happens to be standing in — no hardcoded offset.
///
/// Applied via `converters:` on each model's `@JsonSerializable`, so it
/// covers every `DateTime` on that model without per-field annotations.
class UtcDateTimeConverter implements JsonConverter<DateTime, String> {
  const UtcDateTimeConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json).toLocal();

  @override
  String toJson(DateTime object) => object.toUtc().toIso8601String();
}

/// [UtcDateTimeConverter] for optional fields. Needed as its own type
/// because a `JsonConverter<DateTime, String>` won't match a `DateTime?`
/// field — json_serializable matches converters by exact type.
class NullableUtcDateTimeConverter
    implements JsonConverter<DateTime?, String?> {
  const NullableUtcDateTimeConverter();

  @override
  DateTime? fromJson(String? json) =>
      json == null ? null : DateTime.parse(json).toLocal();

  @override
  String? toJson(DateTime? object) => object?.toUtc().toIso8601String();
}
