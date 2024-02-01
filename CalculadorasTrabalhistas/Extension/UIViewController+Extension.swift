import UIKit

extension UIViewController {
	func getCalculatorViewController(calculator: Calculator) -> UIViewController {
		let nameCalculator = calculator.nameViewController
		
		switch nameCalculator {
		case "NetSalaryViewController" :
			return NetSalaryViewController(calculator: calculator)
		case "VacationViewController" :
			return VacationViewController(calculator: calculator)
		default:
			return UIViewController()
		}
	}

	func currencyInputFormatting(string: String, textField: UITextField) {
		let formatter = NumberFormatter()
		formatter.numberStyle = NumberFormatter.Style.currency
		formatter.locale = NSLocale(localeIdentifier: "pt_BR") as Locale
		let numberFromField = (NSString(string: string).doubleValue)/100
		textField.text = formatter.string(from: numberFromField as NSNumber)
	}
	
	func formatCurrency(value: Double) -> String {
		let formatter = NumberFormatter()
		formatter.numberStyle = NumberFormatter.Style.currency
		formatter.locale = NSLocale(localeIdentifier: "pt_BR") as Locale
		guard let numberFormat = formatter.string(from: value as NSNumber) else { return "0"}
		return numberFormat
	}

}
