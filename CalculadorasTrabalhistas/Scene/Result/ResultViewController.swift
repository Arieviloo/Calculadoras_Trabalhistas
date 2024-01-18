import UIKit

class ResultViewController: UIViewController {
	private let resultView = ResultView()
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		calculateNetSalary(calculator: calculator)
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
		
		title = String(localizedKey: "result")
	}
	
	private func calculateNetSalary(calculator: Calculator) {
		
		let grossSalary = calculator.valueSalaryGross ?? 0
		let additionalDangerouss = porcentage(porcent: calculator.valueAdditionalDangerousness ?? 0, of: grossSalary)
		let additionalInsalubrity = porcentage(porcent: calculator.valueLevelInsalubrity ?? 0, of: grossSalary)
		let otherDiscount = calculator.valueOtherAdditional ?? 0
		let inss = calculateInss(salary: grossSalary + additionalDangerouss + additionalInsalubrity)
		
		let salary = grossSalary + additionalDangerouss + additionalInsalubrity
		print(salary)
		let discount = otherDiscount + inss
		
		let irrf = calculateIrrf(salary: salary, discount: discount, numberDependence: calculator.valueNumberDependent ?? 0)
		print(irrf)
		resultView.valueGrossSalaryLabel.text = formatCurrency(value: grossSalary)
		resultView.valueAdditionalDangeroussLabel.text = formatCurrency(value: additionalDangerouss)
		resultView.valueAdditionalInsalubrityLabel.text = formatCurrency(value: additionalInsalubrity)
		resultView.valueOtherAdditionalLabel.text = formatCurrency(value: otherDiscount)
		
		resultView.valueInssLabel.text = formatCurrency(value: inss)
		resultView.valueIrrfLabel.text = formatCurrency(value: irrf)
	}
	
	private func porcentage(porcent: Double, of value: Double) -> Double {
		return value * porcent
	}
	
	private func calculateInss(salary: Double) -> Double {
		var resultInss = 0.0
		var lastRangeSalary = 0.0
		let aliquots = [0.075, 0.09, 0.12, 0.14]
		let minSalary = [1412, 2666.68, 4000.03, 7786.02]
		
		for minimun in minSalary {
			if let indexMinSalary = minSalary.firstIndex(of: minimun) {
				if salary <= minimun && indexMinSalary == 0 {
					resultInss = salary * aliquots[0]
					break
				}
				if salary <= minimun && indexMinSalary != 0 {
					resultInss = ((salary - lastRangeSalary) * aliquots[indexMinSalary]) + resultInss
					break
				}
				
				if salary > minimun {
					if indexMinSalary == 0 {
						resultInss = minimun * aliquots[0]
					}
					if indexMinSalary != 0 {
						resultInss = ((minimun - lastRangeSalary) * aliquots[indexMinSalary]) + resultInss
					}
					lastRangeSalary = minimun
				}
			}
		}
		
		return resultInss
	}
	
	private func calculateIrrf(salary: Double, discount: Double, numberDependence: Int) -> Double {
		print("1 - ", salary)
		print("2 - ", discount)
		print("3 - ", numberDependence)
		let baseSalary = salary - discount - (Double(numberDependence) * 189.59)
		print("4 - ", baseSalary)
		
		let baseCalculations = [2112, 2826.65, 3751.05, 4664.68]
		let aliquots = [0.075, 0.15, 0.225, 0.275]
		let deductions = [158.40, 370.40, 651.73, 884.96]
		var descountIrrf = 0.0
		
		for base in baseCalculations {
			if let indexCalculation = baseCalculations.firstIndex(of: base) {
				if baseSalary <= base && indexCalculation == 0 {
					descountIrrf = 0.0
					break
				}
				
				if baseSalary <= base {
					let descountAliquot = aliquots[indexCalculation - 1]
					let descountDeduction = deductions[indexCalculation - 1]
					descountIrrf = (baseSalary * descountAliquot) - descountDeduction
					break
				}
				
				if baseSalary > base && indexCalculation == 3 {
					let descountAliquot = aliquots[indexCalculation - 1]
					let descountDeduction = deductions[indexCalculation - 1]
					descountIrrf = (baseSalary * descountAliquot) - descountDeduction
					break
				}
			}
			
		}
		return descountIrrf
	}
	
}
