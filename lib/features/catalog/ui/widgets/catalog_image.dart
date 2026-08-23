import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';

/// Every catalogue image goes through here.
///
/// **Why not `Image.network`:** Flutter's built-in `ImageCache` holds
/// *decoded* frames in memory only, with no disk layer. A grid of product
/// photos overflows its budget quickly, and once an entry is evicted the
/// widget re-fetches it **over the network** — so scrolling down and back up
/// re-downloaded every card a rep had already paid for. On mobile data in
/// the field that is the difference between a list that feels instant and
/// one that stalls each time it is scrolled.
///
/// `CachedNetworkImage` keeps the encoded bytes on disk, so a second look at
/// the same product costs a disk read and survives an app restart.
class CatalogImage extends StatelessWidget {
  final String url;
  final BoxFit fit;

  /// Drawn while the bytes arrive and if they never do. Kept as builders so
  /// each surface can supply its own designed stand-in rather than a shared
  /// grey box.
  final WidgetBuilder placeholderBuilder;
  final WidgetBuilder? errorBuilder;

  /// The width the image is actually painted at, in **logical pixels**.
  ///
  /// Passed to `memCacheWidth` so the bytes are decoded straight to display
  /// size instead of at full resolution. A 2000px catalogue photo decoded
  /// for a half-width card costs roughly forty times the memory it needs,
  /// and that overspend is what evicts everything else from the cache — so
  /// this is as much about *keeping* other images as about this one.
  final int? decodeWidth;

  const CatalogImage({
    super.key,
    required this.url,
    required this.placeholderBuilder,
    this.errorBuilder,
    this.fit = BoxFit.cover,
    this.decodeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      memCacheWidth: decodeWidth,
      // No cross-fade: in a grid the fade reads as flicker when a cached
      // image is already available and would otherwise appear instantly.
      fadeInDuration: Duration.zero,
      fadeOutDuration: Duration.zero,
      placeholder: (context, _) => placeholderBuilder(context),
      errorWidget: (context, _, _) =>
          (errorBuilder ?? placeholderBuilder)(context),
    );
  }
}

/// The neutral fill used while bytes are in flight — the page tone rather
/// than a grey block, so a loading grid reads as empty space and not as a
/// wall of broken tiles.
class CatalogImagePlaceholder extends StatelessWidget {
  const CatalogImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) =>
      Container(color: context.colors.Color13);
}
