// `PATCH /notifications/preferences` is a **partial** update: send only what
// changed, and a language switch is a one-key body. Without
// `includeIfNull: false` every untouched switch would go out as `null` and
// the partial update would quietly stop being partial — flipping settings
// the rep never touched.

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:new_power/features/notifications/data/models/notification_enums.dart';
import 'package:new_power/features/notifications/data/models/notification_view.dart';

Map<String, dynamic> wire(UpdateNotificationPreferencesRequest r) =>
    jsonDecode(jsonEncode(r.toJson())) as Map<String, dynamic>;

void main() {
  test('a language switch sends exactly one key', () {
    final json = wire(
      const UpdateNotificationPreferencesRequest(
        language: NotificationLanguage.ar,
      ),
    );
    expect(json, {'language': 'AR'});
  });

  test('an untouched switch is omitted, not sent as null', () {
    final json = wire(
      const UpdateNotificationPreferencesRequest(marketingEnabled: true),
    );
    expect(json.keys.toList(), ['marketingEnabled']);
    expect(json.containsKey('pushEnabled'), isFalse);
    expect(json.containsKey('securityEnabled'), isFalse);
  });

  test('false is a real value and must survive, not be dropped', () {
    // The bug this guards: treating `false` as "unset" would make a switch
    // impossible to turn *off* — only ever on.
    final json = wire(
      const UpdateNotificationPreferencesRequest(pushEnabled: false),
    );
    expect(json['pushEnabled'], false);
  });

  test('language round-trips in the casing the server returns', () {
    // The server accepts "ar" and "AR" but answers with "AR"; matching it
    // keeps a fetched value comparable to a sent one.
    expect(NotificationLanguage.ar.wireValue, 'AR');
    expect(NotificationLanguage.en.wireValue, 'EN');
    expect(
      NotificationPreferencesView.fromJson(const {
        'securityEnabled': true,
        'systemEnabled': true,
        'marketingEnabled': false,
        'pushEnabled': true,
        'language': 'AR',
      }).language,
      NotificationLanguage.ar,
    );
  });

  test('marketing defaults off, matching the server', () {
    // Broadcasts are opt-in server-side; defaulting to true here would show
    // a rep a switch that disagrees with what they actually receive.
    expect(
      const NotificationPreferencesView().marketingEnabled,
      isFalse,
    );
    expect(const NotificationPreferencesView().securityEnabled, isTrue);
  });

  test('only the three live types exist', () {
    // TRANSACTION and the payment/message values are gone: the server now
    // answers 400 for `?type=TRANSACTION`, so a leftover chip would break
    // the inbox rather than just showing nothing.
    expect(
      NotificationType.values.map((t) => t.wireValue).toSet(),
      {'SECURITY', 'SYSTEM', 'MARKETING', 'UNKNOWN'},
    );
  });
}
