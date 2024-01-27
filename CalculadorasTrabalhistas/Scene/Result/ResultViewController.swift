import UIKit

class ResultViewController: UIViewController {
	
	private let resultView = ResultView()
	private var calculator: Calculator?
	private let resultVM = ResultViewModel()
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		calculateNetSalary(calculator: calculator)
		resultVM.setCalculator(calculator: calculator)
		
		self.calculator = calculator
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
		resultView.delegate(delegate: self)
		title = String(localizedKey: "result")
	}
	
	private func calculateNetSalary(calculator: Calculator) {
		
		let grossSalary = calculator.valueSalaryGross ?? 0
		let additionalDangerouss = porcentage(porcent: calculator.valueAdditionalDangerousness ?? 0, of: grossSalary)
		let additionalInsalubrity = porcentage(porcent: calculator.valueLevelInsalubrity ?? 0, of: grossSalary)
		let otherDiscount = calculator.valueOtherDiscount ?? 0
		let otherAdditional = calculator.valueOtherAdditional ?? 0
		let totalSalaryWithoutDiscount = grossSalary + additionalDangerouss + additionalInsalubrity + otherAdditional
		let inss = resultVM.calculateInss(salary: totalSalaryWithoutDiscount)
		let discount = otherDiscount + inss
		let irrf = resultVM.calculateIrrf(salary: totalSalaryWithoutDiscount, discount: discount, numberDependence: calculator.valueNumberDependent ?? 0)
		
		let resultTotal = totalSalaryWithoutDiscount - (discount + irrf)
		
		resultView.valueGrossSalaryLabel.text = formatCurrency(value: grossSalary)
		resultView.valueAdditionalDangeroussLabel.text = formatCurrency(value: additionalDangerouss)
		resultView.valueAdditionalInsalubrityLabel.text = formatCurrency(value: additionalInsalubrity)
		resultView.valueOtherAdditionalLabel.text = formatCurrency(value: otherAdditional)
		
		resultView.valueInssLabel.text = formatCurrency(value: inss)
		resultView.valueIrrfLabel.text = formatCurrency(value: irrf)
		resultView.valueOtherDiscountsLabel.text = formatCurrency(value: otherDiscount)
		
		resultView.valueResultLabel.text = formatCurrency(value: resultTotal)
	}
	
	private func porcentage(porcent: Double, of value: Double) -> Double {
		return value * porcent
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
