import UIKit

class NetSalaryViewController: UIViewController {
	
	private let netSalaryView = NetSalaryView()
	var currentString = ""
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		title = calculator.name
		dump(calculator)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = netSalaryView
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		netSalaryView.delegate(delegate: self)
		netSalaryView.configTextFieldDelegate(delegate: self)
	}
}

extension NetSalaryViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}

extension NetSalaryViewController: NetSalaryViewProtocol {
	func tappedCalculate() {
		print("NetSalaryViewController")
	}
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		if netSalaryView.otherAdditionalTextField.isEditing {
			switch string {
			case "0"..."9":
				currentString += string
				formatCurrency(string: currentString, textField: netSalaryView.otherAdditionalTextField)
			default:
				let array = Array(string)
				var currentStringArray = Array(currentString)
				if array.count == 0 && currentStringArray.count != 0 {
					currentStringArray.removeLast()
					currentString = ""
					for character in currentStringArray {
						currentString += String(character)
					}
					formatCurrency(string: currentString, textField: netSalaryView.otherAdditionalTextField)
				}
			}
			
		} else {
			return true
		}
		return false
	}
}
