import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/app_shadows.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/app_header.dart';
import '../../data/repo/projects_repository.dart';
import '../widgets/map_marker_icons.dart';
import '../widgets/project_enum_labels.dart';

/// Fallback center when no GPS fix is available and no initial coordinate
/// was passed in — this app's territory is Syria-based, so Damascus is a
/// reasonable default starting view, never submitted as a location itself.
const _fallbackCenter = LatLng(33.5138, 36.2765);

/// Long-press-to-pick, on a real Google map — display only (free tier: map
/// tiles + a handful of `GET /projects` reads), no location history or
/// tracking API in use anywhere in this screen. Pops `({double lat, double
/// lng})` on confirm, `null` if the rep backs out.
///
/// [showNearbyProjects] overlays the rep's own nearby projects
/// (`GET /projects?near=`, owner-scoped — projects-client-reference.md §5)
/// as distinct pins, so a rep picking an activity's location can see which
/// building they're standing next to. Registration doesn't need this (a
/// fresh building has no prior pin to confuse it with, and the doc's own
/// duplicate-candidate flow already covers that case server-side).
class MapPickerScreen extends StatefulWidget {
  final double? initialLatitude;
  final double? initialLongitude;
  final bool showNearbyProjects;

  const MapPickerScreen({
    super.key,
    this.initialLatitude,
    this.initialLongitude,
    this.showNearbyProjects = false,
  });

  @override
  State<MapPickerScreen> createState() => _MapPickerScreenState();
}

class _MapPickerScreenState extends State<MapPickerScreen> {
  GoogleMapController? _controller;
  LatLng? _picked;
  bool _locating = false;
  bool _locationServiceDisabled = false;
  Set<Marker> _projectMarkers = {};
  BitmapDescriptor? _pickedIcon;

  @override
  void initState() {
    super.initState();
    if (widget.initialLatitude != null && widget.initialLongitude != null) {
      _picked = LatLng(widget.initialLatitude!, widget.initialLongitude!);
    }
    _loadPickedIcon();
    if (_picked == null) {
      _locateMe(animate: false);
    } else if (widget.showNearbyProjects) {
      _loadNearbyProjects(_picked!);
    }
  }

  Future<void> _loadPickedIcon() async {
    final colors = context.colors;
    final icon = await MapMarkerIcons.pickedPin(colors.brand500);
    if (mounted) setState(() => _pickedIcon = icon);
  }

  Future<void> _loadNearbyProjects(LatLng center) async {
    final repository = getIt<ProjectsRepository>();
    final colors = context.colors;
    final icon = await MapMarkerIcons.projectPin(colors.statusWon.core);
    // "No radius cap" per the doc — a generous fixed radius stands in for
    // "effectively all of my own projects near here," since this endpoint
    // has no "just give me everything" mode of its own.
    final result = await repository.list(
      near: '${center.latitude},${center.longitude},500000',
      limit: 100,
    );
    if (!mounted) return;
    switch (result) {
      case Success(data: final response):
        setState(() {
          _projectMarkers = {
            for (final project in response.data)
              Marker(
                markerId: MarkerId('project_${project.id}'),
                position: LatLng(project.latitude, project.longitude),
                icon: icon,
                infoWindow: InfoWindow(
                  title: project.name,
                  snippet: context.tr(project.stage.labelKey),
                ),
              ),
          };
        });
      case Failure():
        // Nearby-projects overlay is a convenience, not the point of this
        // screen — a failed fetch just means no extra pins, never blocks
        // picking a location.
        break;
    }
  }

  Future<void> _locateMe({bool animate = true}) async {
    setState(() {
      _locating = true;
      _locationServiceDisabled = false;
    });
    bool serviceDisabled = false;
    Position? position;
    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        serviceDisabled = true;
      } else {
        var permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
        }
        if (permission != LocationPermission.denied &&
            permission != LocationPermission.deniedForever) {
          position = await Geolocator.getCurrentPosition(
            locationSettings: const LocationSettings(
              accuracy: LocationAccuracy.high,
            ),
          );
        }
      }
    } catch (_) {
      // Fall through — the map still works with manual long-press.
    }
    if (!mounted) return;
    setState(() {
      _locating = false;
      _locationServiceDisabled = serviceDisabled;
      if (position != null) {
        _picked = LatLng(position.latitude, position.longitude);
      }
    });
    if (position != null) {
      if (animate) {
        await _controller?.animateCamera(
          CameraUpdate.newLatLngZoom(_picked!, 17),
        );
      }
      if (widget.showNearbyProjects) {
        _loadNearbyProjects(_picked!);
      }
    }
  }

  void _onLongPress(LatLng position) {
    setState(() => _picked = position);
  }

  void _confirm() {
    final picked = _picked;
    if (picked == null) return;
    Navigator.of(
      context,
    ).pop((lat: picked.latitude, lng: picked.longitude));
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final initialCenter = _picked ?? _fallbackCenter;
    return Scaffold(
      backgroundColor: colors.page,
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(title: context.tr('map_picker_title')),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 4.h, 20.w, 8.h),
              child: Text(
                context.tr('map_picker_hint'),
                style: context.textStyles.xsMedium.copyWith(
                  color: colors.textColor70,
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: initialCenter,
                      zoom: 15,
                    ),
                    onMapCreated: (controller) => _controller = controller,
                    onLongPress: _onLongPress,
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                    markers: {
                      ..._projectMarkers,
                      if (_picked != null)
                        Marker(
                          markerId: const MarkerId('picked'),
                          position: _picked!,
                          icon:
                              _pickedIcon ??
                              BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueAzure,
                              ),
                        ),
                    },
                  ),
                  if (_locationServiceDisabled)
                    Positioned(
                      top: 12.h,
                      left: 20.w,
                      right: 20.w,
                      child: _ServiceDisabledBanner(
                        onEnable: () => Geolocator.openLocationSettings(),
                      ),
                    ),
                  Positioned(
                    bottom: 16.h,
                    right: 16.w,
                    child: FloatingActionButton(
                      heroTag: 'map_picker_locate_me',
                      backgroundColor: colors.surface,
                      foregroundColor: colors.brand600,
                      onPressed: _locating ? null : () => _locateMe(),
                      child: _locating
                          ? SizedBox(
                              width: 20.w,
                              height: 20.w,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            )
                          : const Icon(Icons.my_location_rounded),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: AppButton(
                text: context.tr('map_picker_confirm'),
                onPressed: _picked == null ? null : _confirm,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceDisabledBanner extends StatelessWidget {
  final VoidCallback onEnable;
  const _ServiceDisabledBanner({required this.onEnable});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: AppShadows.card,
      ),
      child: Row(
        children: [
          Icon(Icons.location_off_outlined, size: 18.sp, color: colors.error),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              context.tr('projects_register_location_service_disabled'),
              style: context.textStyles.xsMedium,
            ),
          ),
          GestureDetector(
            onTap: onEnable,
            child: Text(
              context.tr('projects_register_location_enable_cta'),
              style: context.textStyles.xsSemibold.copyWith(
                color: colors.brand600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
