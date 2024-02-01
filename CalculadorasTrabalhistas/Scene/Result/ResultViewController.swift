import UIKit

class ResultViewController: UIViewController {
	
	private let resultView = ResultView()
	private let resultVM = ResultViewModel()
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		resultVM.setCalculator(calculator: calculator)
		dump(calculator)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = resultView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configView()
	}
	
	private func configView() {
		title = String(localizedKey: "result")
		guard let calculator = resultVM.calculator else { return }
		resultView.delegate(delegate: self)
		calculateNetSalary(calculator: calculator)
	}
	
	private func calculateNetSalary(calculator: Calculator) {
		let grossSalary = calculator.valueSalaryGross ?? 0
		let additionalDangerouss = resultVM.porcentage(porcent: calculator.valueAdditionalDangerousness ?? 0, of: grossSalary)
		let additionalInsalubrity = resultVM.porcentage(porcent: calculator.valueLevelInsalubrity ?? 0, of: grossSalary)
		let otherDiscount = calculator.valueOtherDiscount ?? 0
		let otherAdditional = calculator.valueOtherAdditional ?? 0
		let totalSalaryWithoutDiscount = grossSalary + additionalDangerouss + additionalInsalubrity + otherAdditional
		let inss = resultVM.calculateInss(salary: totalSalaryWithoutDiscount)
		let discount = otherDiscount + inss
		let irrf = resultVM.calculateIrrf(salary: totalSalaryWithoutDiscount, discount: discount, numberDependent: calculator.valueNumberDependent ?? 0)
		
		let resultTotal = totalSalaryWithoutDiscount - (discount + irrf)
		
		resultView.setValueEarning(
			grossSalary: formatCurrency(value: grossSalary),
			dangerouss: formatCurrency(value: additionalDangerouss),
			insalubrity: formatCurrency(value: additionalInsalubrity),
			otherAdditional: formatCurrency(value: otherAdditional)
		)
		
		resultView.setValueDiscount(
			inss: formatCurrency(value: inss),
			irrf: formatCurrency(value: irrf),
			otherDiscount: formatCurrency(value: otherDiscount)
		)
		
		resultView.setValueResult(result: formatCurrency(value: resultTotal))
		
	}
}

extension ResultViewController: ResultViewProtocol {
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
