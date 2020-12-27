import Flutter
import UIKit
import GoogleMaps

@UIAplicationMain
@objc class AppDelegate: FlutterAppDelegate{
    override func aplication(
        _ aplication: UIAplication,
        didFinishLaunchingWithOptions launchOptions: [UIAplication.launchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        GMSServices.provideAPIKey("")
        return super.aplication(aplication, didFinishLaunchingWithOptions: launchOptions)
    }
}