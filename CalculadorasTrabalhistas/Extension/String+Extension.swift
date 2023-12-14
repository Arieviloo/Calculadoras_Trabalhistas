import UIKit

extension String {
	init(localizedKey: String) {
		let initText = NSLocalizedString(localizedKey, comment: "")
		self.init(initText)
	}
	
	func getViewController() -> UIViewController? {
		if let appName = Bundle.main.infoDictionary?["CFBundleName"] as? String {
			if let viewControllerType = NSClassFromString("\(appName).\(self)") as? UIViewController.Type {
				return viewControllerType.init()
			}
		}
		return nil
	}
}

