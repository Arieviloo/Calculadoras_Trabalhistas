import UIKit

extension String {
	init(localizedKey: String) {
		let initText = NSLocalizedString(localizedKey, comment: "")
		self.init(initText)
	}
}
