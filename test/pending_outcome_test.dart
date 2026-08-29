import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:new_power/features/projects/data/models/enums.dart';
import 'package:new_power/features/projects/data/models/project_detail_view.dart';

/// `GET /projects/{id}` now embeds the claim a manager has not yet decided
/// on, as `pendingOutcome`. The rep must be blocked from filing a second
/// one while it is there — so a field name that silently fails to parse
/// would hand them a form the server will only reject at the very end.
///
/// The payload below is the real response shape, trimmed to the keys this
/// behaviour reads.
void main() {
  Map<String, dynamic> baseProject({Object? pendingOutcome = _absent}) {
    return {
      'id': '2b7c0000-0000-4000-8000-000000000001',
      'name': 'برج الواحة السكني',
      'buildingType': 'APARTMENT_BUILDING',
      'description': 'برج سكني من 12 طابقًا',
      'latitude': 33.5138,
      'longitude': 36.2765,
      'constructionPhase': 'FINISHING',
      'stage': 'COMMITTED',
      'status': 'ACTIVE',
      'ownerId': 'rep-1',
      'version': 7,
      'createdAt': '2026-06-01T09:00:00.000Z',
      'updatedAt': '2026-08-18T09:05:00.000Z',
      'imageCount': 3,
      'images': <dynamic>[],
      'activities': <dynamic>[],
      'stakeholders': <dynamic>[],
      if (pendingOutcome != _absent) 'pendingOutcome': pendingOutcome,
    };
  }

  final wonOutcomeJson = <String, dynamic>{
    'id': '9f4b0000-0000-4000-8000-000000000002',
    'projectId': '2b7c0000-0000-4000-8000-000000000001',
    'projectName': 'برج الواحة السكني',
    'type': 'WON',
    'status': 'PENDING',
    'distributorAccountId': 'a71c0000-0000-4000-8000-000000000003',
    'distributor': {
      'accountId': 'a71c0000-0000-4000-8000-000000000003',
      'name': 'مؤسسة النور للتجهيزات',
      'city': 'دمشق',
      'isAuthorized': true,
    },
    'value': 48500,
    'currency': 'USD',
    'soldAt': '2026-08-18T00:00:00.000Z',
    'categories': ['SOCKETS_SWITCHES', 'CABLES'],
    'unitsSupplied': 900,
    'unitsTotal': 1200,
    'buyerContactId': '77a20000-0000-4000-8000-000000000004',
    'competitorAccountId': null,
    'competitor': null,
    'lossReason': null,
    'competitorPrice': null,
    'narrative': null,
    'notes': null,
    'attachments': [
      {
        'id': 'att-1',
        'key': 'files/raw/2026-08-18/taameed.pdf',
        'name': 'تعميد.pdf',
        'contentType': 'application/pdf',
        'byteSize': 180000,
        'url': 'https://res.cloudinary.com/x',
        'urlExpiresAt': '2026-08-24T13:00:00.000Z',
        'uploadedAt': '2026-08-18T09:00:00.000Z',
        'uploadedBy': 'rep-1',
      },
    ],
    'submittedAt': '2026-08-18T09:05:00.000Z',
    'submittedBy': 'rep-1',
    'confirmedAt': null,
    'rejectedAt': null,
    'rejectionReason': null,
    'previousStage': 'QUOTE_ISSUED',
  };

  group('pendingOutcome on a project detail', () {
    test('parses the whole embedded claim', () {
      final project = ProjectDetailView.fromJson(
        baseProject(pendingOutcome: wonOutcomeJson),
      );

      final outcome = project.pendingOutcome;
      expect(outcome, isNotNull);
      expect(outcome!.type, OutcomeType.won);
      expect(outcome.status, OutcomeStatus.pending);
      expect(outcome.distributor?.name, 'مؤسسة النور للتجهيزات');
      // A JSON *number* on a `double?` field — the shape the server sends.
      expect(outcome.value, 48500.0);
      expect(outcome.currency, 'USD');
      expect(outcome.unitsSupplied, 900);
      expect(outcome.unitsTotal, 1200);
      expect(outcome.categories, [
        ProductCategory.socketsSwitches,
        ProductCategory.cables,
      ]);
      expect(outcome.previousStage, ProjectStage.quoteIssued);
    });

    test('the WON attachments come through as files, not as a count', () {
      final project = ProjectDetailView.fromJson(
        baseProject(pendingOutcome: wonOutcomeJson),
      );

      final attachments = project.pendingOutcome!.attachments;
      expect(attachments, hasLength(1));
      expect(attachments.single.name, 'تعميد.pdf');
      expect(attachments.single.contentType, 'application/pdf');
      expect(attachments.single.byteSize, 180000);
    });

    test('a PENDING claim locks the rep out of submitting another', () {
      final project = ProjectDetailView.fromJson(
        baseProject(pendingOutcome: wonOutcomeJson),
      );
      expect(project.hasPendingOutcome, isTrue);
    });

    test('no pendingOutcome key at all leaves the rep free to submit', () {
      final project = ProjectDetailView.fromJson(baseProject());
      expect(project.pendingOutcome, isNull);
      expect(project.hasPendingOutcome, isFalse);
    });

    test('an explicit null is the same as absent', () {
      final project = ProjectDetailView.fromJson(
        baseProject(pendingOutcome: null),
      );
      expect(project.hasPendingOutcome, isFalse);
    });

    // The contract says this slot only ever carries a PENDING outcome. If a
    // decided one ever landed here, locking the rep out permanently would be
    // worse than trusting the status field — so the status is what decides.
    test('a decided outcome in the slot does not lock the rep out', () {
      for (final status in ['CONFIRMED', 'REJECTED']) {
        final project = ProjectDetailView.fromJson(
          baseProject(
            pendingOutcome: {...wonOutcomeJson, 'status': status},
          ),
        );
        expect(project.pendingOutcome, isNotNull, reason: status);
        expect(project.hasPendingOutcome, isFalse, reason: status);
      }
    });

    test('a LOST claim carries its reason and narrative', () {
      final lost = <String, dynamic>{
        ...wonOutcomeJson,
        'type': 'LOST',
        'distributorAccountId': null,
        'distributor': null,
        'value': null,
        'currency': null,
        'soldAt': null,
        'categories': <dynamic>[],
        'unitsSupplied': null,
        'unitsTotal': null,
        'buyerContactId': null,
        'attachments': <dynamic>[],
        'lossReason': 'PRICE',
        'competitorPrice': 41000,
        'narrative': 'المنافس قدّم سعرًا أقل بعد جولة تفاوض ثانية.',
      };

      final project = ProjectDetailView.fromJson(
        baseProject(pendingOutcome: lost),
      );

      final outcome = project.pendingOutcome!;
      expect(outcome.type, OutcomeType.lost);
      expect(outcome.lossReason, LossReason.price);
      expect(outcome.competitorPrice, 41000.0);
      expect(outcome.narrative, isNotEmpty);
      expect(outcome.attachments, isEmpty);
      expect(project.hasPendingOutcome, isTrue);
    });

    test('survives the encode/decode round trip Dio actually performs', () {
      final project = ProjectDetailView.fromJson(
        baseProject(pendingOutcome: wonOutcomeJson),
      );
      final round = ProjectDetailView.fromJson(
        jsonDecode(jsonEncode(project.toJson())) as Map<String, dynamic>,
      );
      expect(round.hasPendingOutcome, isTrue);
      expect(round.pendingOutcome!.attachments, hasLength(1));
    });
  });
}

/// Distinguishes "key omitted" from "key present and null" in the fixture.
const _absent = Object();
