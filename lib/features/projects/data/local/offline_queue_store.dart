import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../models/queued_activity_record.dart';

/// Raw local persistence for the offline activity queue (§10 Workflow 5).
/// A single `Box<String>` keyed by `clientRef`, each value a JSON-encoded
/// `QueuedActivityRecord` — reuses the model's own generated `toJson`/
/// `fromJson` rather than teaching Hive a type adapter for one small box.
/// `Hive.initFlutter()` must run once at app startup (`main.dart`) before
/// [open] is called.
class OfflineQueueStore {
  static const String boxName = 'activities_offline_queue';

  Box<String>? _box;

  Future<void> open() async {
    _box = await Hive.openBox<String>(boxName);
  }

  Box<String> get _requireBox {
    final box = _box;
    if (box == null) {
      throw StateError('OfflineQueueStore.open() must be awaited first');
    }
    return box;
  }

  List<QueuedActivityRecord> getAll() {
    final records = <QueuedActivityRecord>[];
    for (final raw in _requireBox.values) {
      try {
        records.add(
          QueuedActivityRecord.fromJson(
            jsonDecode(raw) as Map<String, dynamic>,
          ),
        );
      } catch (_) {
        // A corrupt entry (e.g. a future app version's shape) is skipped
        // rather than crashing the whole queue read.
      }
    }
    records.sort((a, b) => a.queuedAt.compareTo(b.queuedAt));
    return records;
  }

  Future<void> put(QueuedActivityRecord record) {
    return _requireBox.put(record.item.clientRef, jsonEncode(record.toJson()));
  }

  Future<void> remove(String clientRef) {
    return _requireBox.delete(clientRef);
  }
}
