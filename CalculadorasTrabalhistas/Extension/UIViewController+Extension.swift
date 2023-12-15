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
}
