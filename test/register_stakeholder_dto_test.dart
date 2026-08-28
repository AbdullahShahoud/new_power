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
          contact: NewStakeholderContact(
            firstName: 'أحمد',
            lastName: 'السيد',
          ),
        ),
        ProjectStakeholderRefDto(
          accountName: 'رامي حداد',
          accountType: AccountType.individual,
          role: StakeholderRole.owner,
        ),
        ProjectStakeholderRefDto(
          accountId: 'acc-1',
          role: StakeholderRole.consultantEngineeringOffice,
          contact: NewStakeholderContact(
            firstName: 'سامر',
            lastName: 'خليل',
          ),
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

    test('rejects pointing at a contact and describing one at once', () {
      expect(
        () => const ProjectStakeholderRefDto(
          accountId: 'acc-1',
          role: StakeholderRole.owner,
          primaryContactId: 'contact-1',
          contact: NewStakeholderContact(
            firstName: 'رامي',
            lastName: 'حداد',
          ),
        ).validate(),
        throwsArgumentError,
      );
    });

    test('rejects accountType without an accountName', () {
      // Next to an accountId it is a claim about a record this request does
      // not own.
      expect(
        () => const ProjectStakeholderRefDto(
          accountId: 'acc-1',
          accountType: AccountType.company,
          role: StakeholderRole.owner,
        ).validate(),
        throwsArgumentError,
      );
    });

    test('holds accountName to 2-200 characters', () {
      for (final name in ['ا', '']) {
        expect(
          () => ProjectStakeholderRefDto(
            accountName: name,
            role: StakeholderRole.mainContractor,
          ).validate(),
          throwsArgumentError,
          reason: 'name=`$name`',
        );
      }
      expect(
        () => ProjectStakeholderRefDto(
          accountName: 'ا' * 201,
          role: StakeholderRole.mainContractor,
        ).validate(),
        throwsArgumentError,
      );
    });
  });

  // The inlined person goes through the same creation path as the standalone
  // contact endpoints, so a value this form accepts but `POST /accounts/{id}
  // /contacts` refuses costs the rep the entire registration.
  group('inline contact validation', () {
    ProjectStakeholderRefDto withContact(NewStakeholderContact contact) =>
        ProjectStakeholderRefDto(
          accountName: 'شركة الأمل للمقاولات',
          accountType: AccountType.company,
          role: StakeholderRole.mainContractor,
          contact: contact,
        );

    test('rejects a name shorter than two characters', () {
      expect(
        () => withContact(
          const NewStakeholderContact(firstName: 'أ', lastName: 'السيد'),
        ).validate(),
        throwsArgumentError,
      );
      expect(
        () => withContact(
          const NewStakeholderContact(firstName: 'أحمد', lastName: 'ب'),
        ).validate(),
        throwsArgumentError,
      );
    });

    test('rejects a name longer than eighty characters', () {
      expect(
        () => withContact(
          NewStakeholderContact(firstName: 'ا' * 81, lastName: 'السيد'),
        ).validate(),
        throwsArgumentError,
      );
    });

    test('rejects Arabic-Indic digits in the phone', () {
      // stakeholders.md: refused rather than transliterated.
      expect(
        () => withContact(
          const NewStakeholderContact(
            firstName: 'أحمد',
            lastName: 'السيد',
            phone: '٠٩٩١٢٣٤٥٦٧',
          ),
        ).validate(),
        throwsArgumentError,
      );
    });

    test('rejects a phone over thirty characters', () {
      expect(
        () => withContact(
          NewStakeholderContact(
            firstName: 'أحمد',
            lastName: 'السيد',
            phone: '0' * 31,
          ),
        ).validate(),
        throwsArgumentError,
      );
    });

    test('rejects a phone carrying no digits, or a misplaced plus', () {
      for (final phone in ['abc', '+', '099+123']) {
        expect(
          () => withContact(
            NewStakeholderContact(
              firstName: 'أحمد',
              lastName: 'السيد',
              phone: phone,
            ),
          ).validate(),
          throwsArgumentError,
          reason: 'phone=`$phone`',
        );
      }
    });

    test('accepts the shapes a rep actually types', () {
      for (final phone in [
        '0991234567',
        '+963991234567',
        '099 123 4567',
        '099-123-4567',
      ]) {
        expect(
          withContact(
            NewStakeholderContact(
              firstName: 'أحمد',
              lastName: 'السيد',
              phone: phone,
            ),
          ).validate,
          returnsNormally,
          reason: 'phone=`$phone`',
        );
      }
    });

    test('a missing phone is still allowed at the model level', () {
      // The *contractor slot* requires one, but that is a form rule — the
      // wire contract keeps `phone` optional, and other slots rely on it.
      expect(
        withContact(
          const NewStakeholderContact(firstName: 'أحمد', lastName: 'السيد'),
        ).validate,
        returnsNormally,
      );
    });
  });
}
