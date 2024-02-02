import UIKit

extension UILabel {
	func setCustomTitleNormal(title: String) {
		translatesAutoresizingMaskIntoConstraints = false
		text = String(localizedKey: "\(title)")
		font = UIFont(name: "Montserrat-light", size: 16)
	}
	
	func setCustomSubtitle(subtitle: String) {
		translatesAutoresizingMaskIntoConstraints = false
		text = String(localizedKey: "\(subtitle)")
		font = UIFont(name: "Montserrat-Medium", size: 10)
		numberOfLines = 0
	}
	
	func setTextSmall(title: String) {
		translatesAutoresizingMaskIntoConstraints = false
		text = String(localizedKey: "\(title)")
		font = UIFont(name: "Montserrat-light", size: 12)
	}
	
	func setTextStrong(title: String, color: UIColor) {
		translatesAutoresizingMaskIntoConstraints = false
		text = String(localizedKey: "\(title)")
		font = UIFont(name: "Montserrat-ExtraBold", size: 20)
		textColor = color
	}
	
	func setCustomTitleOptional(title: String) {
		translatesAutoresizingMaskIntoConstraints = false
		text = String(localizedKey: "\(title)")
		font = UIFont(name: "Montserrat-light", size: 8)
	}
}

extension UITextField {
	func setCustomTextField() {
		translatesAutoresizingMaskIntoConstraints = false
		leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 40))
		leftViewMode = .always
		font = UIFont.systemFont(ofSize: 18)
		backgroundColor = UIColor.appGray
		clipsToBounds = true
		layer.cornerRadius = 10
		autocorrectionType = .no
		keyboardType = .numbersAndPunctuation
	}
}

extension UIButton {
	func setCustomButton(title: String, colorBackground: UIColor) {
		translatesAutoresizingMaskIntoConstraints = false
		setTitle(String(localizedKey: "\(title)").uppercased(), for: .normal)
		titleLabel?.font = UIFont(name: "Montserrat-ExtraBold", size: 18)
		backgroundColor = colorBackground
		tintColor = .white
		clipsToBounds = true
		layer.cornerRadius = 10
	}
}
