## CALayer Speed Demo

This is a simple iOS app that demos the effect of adjusting the speed property on a CALayer object, in particularly the CALayer object of a UIWindow. Watch as the app speeds up and slows down! 👀

### Usage

**For double-speed animations**:  

``` swift
window.layer.speed = 2.0 // Super fast 🏎💨 
```

**For half-speed animations**:  

``` swift
window.layer.speed = 0.5 // Super slow 🐢
```

**For a subtle speed boost**:

``` swift
window.layer.speed = 1.2 // Subtle boost 👌
```

**To set back to the default**:  

``` swift
window.layer.speed = 1.0 // default
```  

###To set this up in your own app `AppDelegate`:
``` swift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.layer.speed = 1.2 // Subtle boost
		
		return true
	}	
}
```
