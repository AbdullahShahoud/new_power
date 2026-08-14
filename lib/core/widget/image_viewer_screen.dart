import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/extensions.dart';
import '../helpers/spacing.dart';
import '../theming/app_radius.dart';

/// One image to show full-screen. Exactly one of [url] / [file] is set —
/// remote photos (a project's signed gallery URLs) and local ones (files
/// picked but not yet uploaded) both need the same viewer.
class ViewableImage {
  final String? url;
  final File? file;
  final String? caption;

  const ViewableImage.network(String this.url, {this.caption}) : file = null;
  const ViewableImage.file(File this.file, {this.caption}) : url = null;
}

/// Full-screen, swipeable, pinch-zoomable image viewer.
///
/// Deliberately **not** a `photo_view`-style dependency: `PageView` +
/// `InteractiveViewer` are both in the framework and cover everything
/// needed here (swipe between, pinch/pan within, double-tap to reset), so
/// this adds no package to `pubspec.yaml`.
///
/// Always dark-chrome regardless of theme — that's the near-universal
/// convention for media viewers and it isn't a palette change, it's a
/// deliberate full-bleed surface so the photo carries the screen.
class ImageViewerScreen extends StatefulWidget {
  final List<ViewableImage> images;
  final int initialIndex;

  const ImageViewerScreen({
    super.key,
    required this.images,
    this.initialIndex = 0,
  });

  @override
  State<ImageViewerScreen> createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  late final PageController _controller = PageController(
    initialPage: widget.initialIndex,
  );
  late int _index = widget.initialIndex;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final current = widget.images.isEmpty ? null : widget.images[_index];
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            onPageChanged: (i) => setState(() => _index = i),
            itemBuilder: (context, i) => _ZoomableImage(image: widget.images[i]),
          ),

          // Close button, inset from the safe area.
          // Directional so it mirrors to the correct corner in Arabic.
          PositionedDirectional(
            top: MediaQuery.paddingOf(context).top + 8.h,
            start: 12.w,
            child: _CircleButton(
              icon: Icons.close_rounded,
              onTap: () => context.pop(),
            ),
          ),

          // Counter + caption strip.
          if (widget.images.length > 1 || current?.caption != null)
            Positioned(
              left: 0,
              right: 0,
              bottom: MediaQuery.paddingOf(context).bottom + 16.h,
              child: Column(
                children: [
                  if (current?.caption != null) ...[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      child: Text(
                        current!.caption!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    verticalSpace(10.h),
                  ],
                  if (widget.images.length > 1)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0; i < widget.images.length; i++)
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: EdgeInsets.symmetric(horizontal: 3.w),
                            width: i == _index ? 18.w : 6.w,
                            height: 6.w,
                            decoration: BoxDecoration(
                              color: i == _index
                                  ? Colors.white
                                  : Colors.white.withValues(alpha: 0.4),
                              borderRadius: BorderRadius.circular(
                                AppRadius.full,
                              ),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _ZoomableImage extends StatefulWidget {
  final ViewableImage image;

  const _ZoomableImage({required this.image});

  @override
  State<_ZoomableImage> createState() => _ZoomableImageState();
}

class _ZoomableImageState extends State<_ZoomableImage> {
  final _transformController = TransformationController();

  @override
  void dispose() {
    _transformController.dispose();
    super.dispose();
  }

  /// Double-tap toggles between fit and 2.5×, zooming toward the tapped
  /// point rather than the centre — otherwise zooming into a corner of a
  /// wide photo takes several pans to reach.
  void _onDoubleTapDown(TapDownDetails details) {
    final isZoomed = _transformController.value.getMaxScaleOnAxis() > 1.01;
    if (isZoomed) {
      _transformController.value = Matrix4.identity();
      return;
    }
    const scale = 2.5;
    final position = details.localPosition;
    _transformController.value = Matrix4.identity()
      ..translateByDouble(
        -position.dx * (scale - 1),
        -position.dy * (scale - 1),
        0,
        1,
      )
      ..scaleByDouble(scale, scale, scale, 1);
  }

  @override
  Widget build(BuildContext context) {
    final image = widget.image;
    return GestureDetector(
      onDoubleTapDown: _onDoubleTapDown,
      // Swallowed so the double-tap handler above owns the gesture.
      onDoubleTap: () {},
      child: InteractiveViewer(
        transformationController: _transformController,
        minScale: 1,
        maxScale: 5,
        child: Center(
          child: image.file != null
              ? Image.file(image.file!, fit: BoxFit.contain)
              : Image.network(
                  image.url!,
                  fit: BoxFit.contain,
                  loadingBuilder: (_, child, progress) => progress == null
                      ? child
                      : const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                  errorBuilder: (_, _, _) => Icon(
                    Icons.broken_image_outlined,
                    color: Colors.white54,
                    size: 48.sp,
                  ),
                ),
        ),
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38.w,
        height: 38.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.45),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20.sp),
      ),
    );
  }
}
