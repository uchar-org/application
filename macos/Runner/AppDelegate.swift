import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }

  override func applicationDidFinishLaunching(_ notification: Notification) {
    let controller : FlutterViewController = mainFlutterWindow?.contentViewController as! FlutterViewController
    
    let channel = FlutterMethodChannel(name: "mac_haptic",
                                        binaryMessenger: controller.engine.binaryMessenger)
    
    channel.setMethodCallHandler { (call: FlutterMethodCall, result: FlutterResult) in
      if call.method == "lightImpact" {
        NSHapticFeedbackManager.defaultPerformer.perform(.alignment, performanceTime: .default)
        result(nil)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    super.applicationDidFinishLaunching(notification)
  }
}
