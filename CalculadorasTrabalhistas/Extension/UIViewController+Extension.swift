import UIKit

extension UIViewController {
	func getCalculatorViewController(calculator: Calculator) -> UIViewController {
		let nameCalculator = calculator.nameViewController
		
		switch nameCalculator {
		case "NetSalaryViewController" :
			return NetSalaryViewController(calculator: calculator)
		default:
			return UIViewController()
		}
	}

	func formatCurrency(string: String, textField: UITextField) {
		let formatter = NumberFormatter()
		formatter.numberStyle = NumberFormatter.Style.currency
		formatter.locale = NSLocale(localeIdentifier: "pt_BR") as Locale
		let numberFromField = (NSString(string: string).doubleValue)/100
		textField.text = formatter.string(from: numberFromField as NSNumber)
	}

}
