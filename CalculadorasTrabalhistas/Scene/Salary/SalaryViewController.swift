import UIKit

class SalaryViewController: UIViewController {
	
	private let salaryView = SalaryView()
	private let salaryVM = SalaryViewModel()
	private var currentString = ""
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		salaryVM.setCalculator(calculator: calculator)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = salaryView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configView()
	}
	
	private func configView() {
		title = salaryVM.getTitle()
		self.salaryView.configTextFieldDelegate(delegate: self)
		self.salaryView.delegate(delegate: self)
	}
}

extension SalaryViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//		textField.resignFirstResponder()
		let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
		tap.cancelsTouchesInView = false
		view.addGestureRecognizer(tap)
		return true
	}
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { 
		// return NO to not change text

		if salaryView.salaryValueTextField.isEditing {
			switch string {
			case "0"..."9":
				currentString += string
				currencyInputFormatting(string: currentString, textField: salaryView.salaryValueTextField)
			default:
				let array = Array(string)
				var currentStringArray = Array(currentString)
				if array.count == 0 && currentStringArray.count != 0 {
					currentStringArray.removeLast()
					currentString = ""
					for character in currentStringArray {
						currentString += String(character)
					}
					currencyInputFormatting(string: currentString, textField: salaryView.salaryValueTextField)
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
		let valueSalary = (NSString(string: currentString).doubleValue)/100
		let valueDependent = (NSString(string: salaryView.dependentValueTextField.text ?? "0").integerValue)
		salaryVM.setSalaryAndDependent(salary: valueSalary, numberDependent: valueDependent)
		
		guard let calculator = salaryVM.calculator else { return }
		let additionalVC = AdditionalViewController(calculator: calculator)
		navigationController?.pushViewController(additionalVC, animated: true)
	}
	
}
