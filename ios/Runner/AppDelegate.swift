import Flutter
import GoogleMaps
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Google Maps SDK (google_maps_flutter) — free-tier display only:
    // MapPickerScreen and the nearby-own-projects overlay. No tracking.
    GMSServices.provideAPIKey("AIzaSyCOmv1TLhNOfXKPIEVDwe196BWMnRHWVcI")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
