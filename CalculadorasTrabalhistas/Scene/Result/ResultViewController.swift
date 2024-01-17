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
		let additionalDangerouss = calculator.valueAdditionalDangerousness ?? 0
		let additionalInsalubrity = calculator.valueLevelInsalubrity ?? 0
		let otherAdditinal = calculator.valueOtherAdditional ?? 0
		
		resultView.valueGrossSalaryLabel.text = formatCurrency(value: grossSalary)
		resultView.valueAdditionalDangeroussLabel.text = formatCurrency(value: porcentage(porcent: additionalDangerouss, of: grossSalary))
		resultView.valueAdditionalInsalubrityLabel.text = formatCurrency(value: porcentage(porcent: additionalInsalubrity, of: grossSalary))
		resultView.valueOtherAdditionalLabel.text = formatCurrency(value: otherAdditinal)
		
		let pom = calculateInss(salary: grossSalary)
		print("pommmm - > ", pom)
	}
	
	private func porcentage(porcent: Double, of value: Double) -> Double {
		return value * porcent
	}
	
	private func calculateInss(salary: Double) -> Double {
		var resultInss = 0.0
		var rangeSalary = 0.0
		let porcents = [0.075, 0.09, 0.12, 0.14]
		let minSalary = [1412, 2666.69, 4000.04, 7786.02]
		
		for minimun in minSalary {
			if let indexMinSalary = minSalary.firstIndex(of: minimun) {
				print(indexMinSalary)
				print(rangeSalary)
				if salary <= minimun && indexMinSalary == 0 {
					resultInss = salary * porcents[0]
					break
				}
				if salary <= minimun && indexMinSalary != 0 {
					resultInss = ((salary - rangeSalary) * porcents[indexMinSalary]) + resultInss
					break
				}
				
				if salary > minimun {
					if indexMinSalary == 0 {
						resultInss = minimun * porcents[0]
					}
					if indexMinSalary != 0 {
						resultInss = ((minimun - rangeSalary) * porcents[indexMinSalary]) + resultInss
					}
					rangeSalary = minimun
				}
			}
		}
		
		return resultInss
	}
	
}
