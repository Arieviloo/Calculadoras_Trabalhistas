import UIKit

class RescissionViewController: UIViewController {
	
	private let rescissionView = RescissionView()
	private let rescissionVM = RescissionViewModel()
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		dump(calculator)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = rescissionView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.hideKeyboardWhenTappedAround()
		configView()
	}
	
	private func configView() {
		rescissionView.configTextFieldDelegate(delegate: self)
		rescissionView.delegate(delegate: self)
	}
}

extension RescissionViewController: UITextFieldDelegate {
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		if (rescissionView.dateContractingTextField.text?.count == 14) {
			rescissionVM.stringFromDate(textField.text ?? "")
		}
		
		if (rescissionView.dateResignationTextField.text?.count == 14) {
			rescissionVM.stringFromDate(textField.text ?? "")
		}
	}
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		if rescissionView.dateContractingTextField.isEditing {
			if rescissionView.dateContractingTextField.isEditing {
				if rescissionView.dateContractingTextField.text?.count == 2 || rescissionView.dateContractingTextField.text?.count == 7 {
					if !(string == "") {
						rescissionView.dateContractingTextField.text = (rescissionView.dateContractingTextField.text ?? "") + " / "
					}
				}
				return !(textField.text!.count > 13 && (string.count ) > range.length)
			}
		}
		
		if rescissionView.dateResignationTextField.isEditing {
			if textField.text?.count == 2 || textField.text?.count == 7 {
				textField.text = (textField.text ?? "") + " / "
			}
			return !(textField.text?.count == 14)
		}
		
		return false
	}
}

extension RescissionViewController: RescissionViewProtocol {
	func tappedNext() {
		let nextVC = ListReasonViewController()
		
		navigationController?.pushViewController(nextVC, animated: true)
	}
	
	
}
