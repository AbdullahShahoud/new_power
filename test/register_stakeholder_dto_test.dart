// The registration body accepts four stakeholder shapes through one object,
// bound by one rule: each element names its account **exactly one way**.
//
// The rule is easy to break silently. json_serializable emits every key by
// default, so without `includeIfNull: false` a "create new" element would
// ship `"accountId": null` beside its `accountName` — the server sees both
// keys, and the whole registration 400s after the rep has already waited for
// photo uploads. These tests pin the serialised shape, not just the fields.

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:new_power/features/projects/data/models/enums.dart';
import 'package:new_power/features/projects/data/models/register_project_request.dart';

/// The JSON that actually reaches the server.
///
/// Asserted through `jsonEncode` rather than off the raw `toJson()` map on
/// purpose: this codebase leaves `explicitToJson` at its default, so nested
/// models stay as objects in the map and are converted by the encoder — the
/// same path Dio takes. Reading the map directly would test an intermediate
/// that no request ever sends.
Map<String, dynamic> wire(ProjectStakeholderRefDto dto) =>
    jsonDecode(jsonEncode(dto.toJson())) as Map<String, dynamic>;

void main() {
  group('stakeholder wire shape', () {
    test('a new company omits accountId entirely', () {
      final json = wire(const ProjectStakeholderRefDto(
        accountName: 'شركة الأمل للمقاولات',
        accountType: AccountType.company,
        role: StakeholderRole.mainContractor,
        contact: NewStakeholderContact(
          firstName: 'أحمد',
          lastName: 'السيد',
          phone: '0991234567',
        ),
      ));

      expect(json.containsKey('accountId'), isFalse);
      expect(json.containsKey('primaryContactId'), isFalse);
      expect(json['accountName'], 'شركة الأمل للمقاولات');
      expect(json['accountType'], 'COMPANY');
      expect(json['role'], 'MAIN_CONTRACTOR');
      expect((json['contact'] as Map)['phone'], '0991234567');
    });

    test('an individual owner carries no contact key', () {
      final json = wire(const ProjectStakeholderRefDto(
        accountName: 'رامي حداد',
        accountType: AccountType.individual,
        role: StakeholderRole.owner,
      ));

      expect(json['accountType'], 'INDIVIDUAL');
      expect(json.containsKey('contact'), isFalse);
      expect(json.containsKey('accountId'), isFalse);
    });

    test('an existing account with a new face omits accountName', () {
      final json = wire(const ProjectStakeholderRefDto(
        accountId: 'acc-1',
        role: StakeholderRole.consultantEngineeringOffice,
        contact: NewStakeholderContact(firstName: 'سامر', lastName: 'خليل'),
      ));

      expect(json['accountId'], 'acc-1');
      expect(json.containsKey('accountName'), isFalse);
      expect(json.containsKey('accountType'), isFalse);
    });

    test('the original existing-account shape still serialises', () {
      final json = wire(const ProjectStakeholderRefDto(
        accountId: 'acc-1',
        role: StakeholderRole.electricalMepSubcontractor,
        primaryContactId: 'contact-1',
      ));

      expect(json['primaryContactId'], 'contact-1');
      expect(json.containsKey('accountName'), isFalse);
      expect(json.containsKey('contact'), isFalse);
    });
  });

  group('stakeholder validation', () {
    test('rejects naming the account both ways', () {
      expect(
        () => const ProjectStakeholderRefDto(
          accountId: 'acc-1',
          accountName: 'شركة',
          role: StakeholderRole.owner,
        ).validate(),
        throwsArgumentError,
      );
    });

    test('rejects naming the account no way at all', () {
      expect(
        () =>
            const ProjectStakeholderRefDto(role: StakeholderRole.owner)
                .validate(),
        throwsArgumentError,
      );
    });

    test('rejects primaryContactId without an accountId', () {
      // A contact id cannot point into an account that does not exist yet.
      expect(
        () => const ProjectStakeholderRefDto(
          accountName: 'شركة جديدة',
          role: StakeholderRole.owner,
          primaryContactId: 'contact-1',
        ).validate(),
        throwsArgumentError,
      );
    });

    test('accepts each of the four valid shapes', () {
      const shapes = [
        ProjectStakeholderRefDto(
          accountName: 'شركة',
          accountType: AccountType.company,
          role: StakeholderRole.mainContractor,
          contact: NewStakeholderContact(firstName: 'أ', lastName: 'ب'),
        ),
        ProjectStakeholderRefDto(
          accountName: 'رامي حداد',
          accountType: AccountType.individual,
          role: StakeholderRole.owner,
        ),
        ProjectStakeholderRefDto(
          accountId: 'acc-1',
          role: StakeholderRole.consultantEngineeringOffice,
          contact: NewStakeholderContact(firstName: 'س', lastName: 'خ'),
        ),
        ProjectStakeholderRefDto(
          accountId: 'acc-1',
          role: StakeholderRole.electricalMepSubcontractor,
          primaryContactId: 'contact-1',
        ),
      ];
      for (final shape in shapes) {
        expect(shape.validate, returnsNormally);
      }
    });
  });
}
