import UIKit

class RescissionViewController: UIViewController {
	
	private let rescissionView = RescissionView()
	
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
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		if rescissionView.dateContractingTextField.isEditing {
			if rescissionView.dateContractingTextField.text?.count == 2 || rescissionView.dateContractingTextField.text?.count == 7 {
				if !(string == "") {
					rescissionView.dateContractingTextField.text = (rescissionView.dateContractingTextField.text ?? "") + " / "
				}
			}
			return !(textField.text!.count > 13 && (string.count ) > range.length)
		}
		
		if rescissionView.dateResignationTextField.isEditing {
			if rescissionView.dateResignationTextField.text?.count == 2 || rescissionView.dateResignationTextField.text?.count == 7 {
				if !(string == "") {
					rescissionView.dateResignationTextField.text = (rescissionView.dateResignationTextField.text ?? "") + " / "
				}
			}
			return !(textField.text!.count > 13 && (string.count ) > range.length)
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
