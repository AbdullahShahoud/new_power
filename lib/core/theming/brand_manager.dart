import 'package:flutter/foundation.dart';

import '../helpers/cache_helper.dart';
import 'brand.dart';

/// Holds the brand this installation is running as.
///
/// `null` means **not chosen yet**, which is what sends the app to the brand
/// picker on first launch. It is not a "no brand" state the app ever runs in.
///
/// ## Why the choice is one-way
///
/// The brand is picked once and then fixed for the install. That is a product
/// decision, not a technical limit — but it is worth stating where the code
/// enforces it, because [select] deliberately refuses to overwrite an
/// existing value rather than trusting every future caller to check first.
/// A rep who picks the wrong line reinstalls; a rep who can flip it from a
/// settings row would be one mis-tap away from an app that looks like a
/// different company's.
///
/// ## Lifetime
///
/// Registered in `setupCoreSingletons`, alongside `ThemeNotifier` and
/// `LanguageManager` — app-lifetime, and untouched by the logout teardown.
/// `MyApp` listens to it and rebuilds the theme and `BrandScope` when it
/// changes, which happens exactly once: at the moment of first selection.
class BrandManager extends ValueNotifier<Brand?> {
  BrandManager() : super(null) {
    _restore();
  }

  /// Read synchronously — `CacheHelper.init()` has already completed by the
  /// time this is constructed (see `main`), so there is no window in which
  /// the app renders unbranded before the stored value arrives.
  void _restore() {
    value = Brand.fromStorageKey(
      CacheHelper.getData(key: CacheHelper.brand) as String?,
    );
  }

  bool get hasSelection => value != null;

  /// Persists the first selection. Later calls are ignored.
  ///
  /// Returns whether the value was actually stored, so a caller that expects
  /// to be making the initial choice can tell if it was beaten to it — a
  /// silent no-op on a second call would otherwise look like a save that
  /// worked.
  Future<bool> select(Brand brand) async {
    if (value != null) return false;
    await CacheHelper.saveData(key: CacheHelper.brand, value: brand.storageKey);
    value = brand;
    return true;
  }
}
