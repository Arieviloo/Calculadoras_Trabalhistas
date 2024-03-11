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
		configView()
	}
	
	private func configView() {
		title = String(localizedKey: "result")
		vacationResultView.delegate(delegate: self)
		calculateNetSalary()
	}
	
	private func calculateNetSalary() {
		let resultCalculation = resultVM.calculateVacation()
		
		vacationResultView.setValueVacation(
			oneThirdVacation: formatCurrency(value: resultCalculation.oneThirdVacation ?? 0),
			allowancePecuniary: formatCurrency(value: resultCalculation.allowancePecuniary ?? 0),
			oneThirdAllowancePecuniary: formatCurrency(value: resultCalculation.oneThirdAllowancePecuniary ?? 0),
			firstInstalmentThirteenth: formatCurrency(value: resultCalculation.advanceFirstInstalmentThirteenth ?? 0)
		)
		
		vacationResultView.setValueEarning(
			grossSalary: formatCurrency(value: resultCalculation.salaryVacation ?? 0),
			dangerouss: formatCurrency(value: resultCalculation.additionalDangerouss ?? 0),
			insalubrity: formatCurrency(value: resultCalculation.additionalInsalubrity ?? 0),
			otherAdditional: formatCurrency(value: resultCalculation.otherAdditional ?? 0)
		)
		
		vacationResultView.setValueDiscount(
			inss: formatCurrency(value: resultCalculation.inss ?? 0),
			irrf: formatCurrency(value: resultCalculation.irrf ?? 0),
			otherDiscount: formatCurrency(value: resultCalculation.otherDiscount ?? 0)
		)
		
		vacationResultView.setValueResult(result: formatCurrency(value: resultCalculation.total ?? 0))
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
