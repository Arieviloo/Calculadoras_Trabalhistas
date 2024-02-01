import UIKit

class VacationViewController: UIViewController {
	private let vacationView = VacationView()
	
	override func loadView() {
		view = vacationView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configView()
	}
	
	private func configView() {
		vacationView.delegate(delegate: self)
		vacationView.configTextFieldDelegate(delegate: self)
	}
}

extension VacationViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
}

extension VacationViewController: VacationViewProtocol {
	func tappedNext() {
		print("button next")
	}
	
	func tappedSellVacation() {
		vacationView.homManyDaysLabel.isHidden = !vacationView.willSellVacationSwitch.isOn
		vacationView.homManyDaysTextField.isHidden = !vacationView.willSellVacationSwitch.isOn
	}
	
}
