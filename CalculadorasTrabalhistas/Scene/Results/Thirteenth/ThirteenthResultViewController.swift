import UIKit

class ThirteenthResultViewController: UIViewController {
	
	private let thirteenthResultView = ThirteenthThirteenthResultView()
	private let thirteenthResultVM = ThirteenthResultViewModel()
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		thirteenthResultVM.setCalculator(calculator: calculator)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = thirteenthResultView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configView()
	}
	
	private func configView() {
		title = String(localizedKey: "result")
		thirteenthResultView.delegate(delegate: self)
		calculateResult()
	}
	
	private func calculateResult() {
		let result = thirteenthResultVM.calculateThirteenth()
		
		thirteenthResultView.setValueEarning(grossSalary: formatCurrency(value: result.grossSalary ?? 0) ,
											 dangerouss: formatCurrency(value: result.additionalDangerouss ?? 0),
											 insalubrity: formatCurrency(value: result.additionalInsalubrity ?? 0))
		
		thirteenthResultView.setValueMonthAndPayment(month: "\(result.monthWorked ?? 0)", type: result.typePayment ?? "")
		
		thirteenthResultView.setValueProportional(salary: formatCurrency(value: result.salaryProportional ?? 0),
												  inss: formatCurrency(value: result.inss ?? 0),
												  irrf: formatCurrency(value: result.irrf ?? 0))
		
		thirteenthResultView.setValueResult(result: formatCurrency(value: result.total ?? 0))
	}
}


extension ThirteenthResultViewController: ThirteenthResultViewProtocol {
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
