import UIKit

class SalaryViewController: UIViewController {
	
	private let salaryView = SalaryView()
	private var calculator: Calculator?
	var currentString = ""
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		self.calculator = calculator
		title = "\(calculator.name)"
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	override func loadView() {
		view = salaryView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.salaryView.configTextFieldDelegate(delegate: self)
		self.salaryView.delegate(delegate: self)
	}
}

extension SalaryViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { // return NO to not change text
		
		if salaryView.salaryValueTextField.isEditing {
			switch string {
			case "0"..."9":
				currentString += string
				formatCurrency(string: currentString, textField: salaryView.salaryValueTextField)
			default:
				let array = Array(string)
				var currentStringArray = Array(currentString)
				if array.count == 0 && currentStringArray.count != 0 {
					currentStringArray.removeLast()
					currentString = ""
					for character in currentStringArray {
						currentString += String(character)
					}
					formatCurrency(string: currentString, textField: salaryView.salaryValueTextField)
				}
			}
			
		} else {
			return true
		}
		
		return false
	}
}

extension SalaryViewController: SalaryViewProtocol {
	func tappedNext() {
		guard let calculator else { return }
		let additionalVC = AdditionalViewController(calculator: calculator)
		navigationController?.pushViewController(additionalVC, animated: true)
	}
	
}
