/// Sentinel marking a partial-update field as "not supplied" — distinct
/// from an explicit `null`. `PATCH /projects/{id}` docs it directly:
/// "Omitted fields are left alone; an explicit `null` clears the field."
/// `PUT /projects/{id}/location`'s nullable `addressLine` uses the same
/// wording, so it gets the same treatment for consistency (see
/// projects-implementation-map.md §10.1).
///
/// Freezed's generated `toJson` always emits every key, so requests that
/// need this distinction are plain classes with a hand-written `toJson`
/// rather than `@freezed`, instead of fighting the generator for one field.
class Omit {
  const Omit._();
}

const omit = Omit._();
