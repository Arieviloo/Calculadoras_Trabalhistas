import UIKit

class VacationResultViewController: UIViewController {
	private let vacationResultView = VacationResultView()
	private let resultVM = VacationResultViewModel()
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		resultVM.setCalculator(calculator: calculator)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = vacationResultView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = String(localizedKey: "result")
		vacationResultView.delegate(delegate: self)
	}
	
}

extension VacationResultViewController: VacationResultViewProtocol {
	func tappedSimulateAgainButton() {
		if let destinationViewController = navigationController?.viewControllers
			.filter({$0 is SalaryViewController})
			.first {navigationController?.popToViewController(destinationViewController, animated: true)
		}
	}
	
	func tappedOtherCalculationButton() {
		navigationController?.popToRootViewController(animated: true)
	}
	
}
