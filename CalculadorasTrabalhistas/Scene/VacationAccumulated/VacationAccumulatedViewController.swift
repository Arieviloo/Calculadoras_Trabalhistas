import UIKit

class VacationAccumulatedViewController: UIViewController {
	
	private let vacationAccumulatedView = VacationAccumulatedView()
	private let vacationAccumulatedVM = VacationAccumulatedViewModel()
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		vacationAccumulatedVM.setCalculator(calculator: calculator)
		dump(calculator)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = vacationAccumulatedView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configView()
	}
	
	
	private func configView() {
		title = vacationAccumulatedVM.getTitle()
		hideKeyboardWhenTappedAround()
		vacationAccumulatedView.configTextFieldDelegate(delegate: self)
		vacationAccumulatedView.delegate(delegate: self)
	}
}

extension VacationAccumulatedViewController: UITextFieldDelegate {
	
}

extension VacationAccumulatedViewController: VacationAccumulatedViewProtocol {
	func tappedCalculate() {
		vacationAccumulatedVM.setVacationAccumulated(isAccumulated: vacationAccumulatedView.haveVacationAccumulatedSwitch.isOn,
													 quantityDay: NSString(string: vacationAccumulatedView.homManyDaysTextField.text ?? "0").integerValue
		)
		
		dump(vacationAccumulatedVM.calculator)
	}
	
}
