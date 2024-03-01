import UIKit

class VacationViewController: UIViewController {
	private let vacationView = VacationView()
	private let vacationVM = VacationViewModel()
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		vacationVM.setCalculator(calculator: calculator)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = vacationView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.hideKeyboardWhenTappedAround()
		configView()
	}
	
	private func configView() {
		title = vacationVM.getTitle()
		vacationView.delegate(delegate: self)
	}
}


extension VacationViewController: VacationViewProtocol {
	func tappedNext() {
		vacationVM.setDayVacation(amountDay: (NSString(string: vacationView.amountVacationTextField.text ?? "0").integerValue),
								  isThirteenth: vacationView.willAnticipateThirteenthSwitch.isOn,
								  isSell: vacationView.willSellVacationSwitch.isOn,
								  homManyDay: (NSString(string: vacationView.homManyDaysTextField.text ?? "0").integerValue))
		
		guard let calculator = vacationVM.calculator else { return }
		let nextVC = VacationResultViewController(calculator: calculator)
		navigationController?.pushViewController(nextVC, animated: true)
	}
	
	func tappedSellVacation() {
		vacationView.homManyDaysLabel.isHidden = !vacationView.willSellVacationSwitch.isOn
		vacationView.homManyDaysTextField.isHidden = !vacationView.willSellVacationSwitch.isOn
	}
	
}
