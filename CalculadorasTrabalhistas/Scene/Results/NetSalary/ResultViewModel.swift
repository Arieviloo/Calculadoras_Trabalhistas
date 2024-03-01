import UIKit

class ResultViewModel {
	private(set) var calculator: Calculator?
	private var resultCalculation = ResultCalculation()
	
	public func setCalculator(calculator: Calculator) { self.calculator = calculator }
	
	public func calculationResultFinal() -> ResultCalculation {
		
		resultCalculation.grossSalary = calculator?.valueSalaryGross
		resultCalculation.additionalDangerouss = porcentage(porcent: calculator?.valueAdditionalDangerousness ?? 0, of: resultCalculation.grossSalary ?? 0)
		resultCalculation.additionalInsalubrity = porcentage(porcent: calculator?.valueLevelInsalubrity ?? 0, of: resultCalculation.grossSalary ?? 0)
		resultCalculation.otherDiscount = calculator?.valueOtherDiscount ?? 0
		resultCalculation.otherAdditional = calculator?.valueOtherAdditional ?? 0
		
		let totalSalaryWithoutDiscount = Double(resultCalculation.grossSalary ?? 0) + Double(resultCalculation.additionalDangerouss ?? 0) + Double(resultCalculation.additionalInsalubrity ?? 0) + Double(resultCalculation.otherAdditional ?? 0)
		resultCalculation.inss = totalSalaryWithoutDiscount.calculateInss()
		let discount = Double(resultCalculation.otherDiscount ?? 0) + Double(resultCalculation.inss ?? 0)
		resultCalculation.irrf = totalSalaryWithoutDiscount.calculateIrrf(discount: discount, numberDependent: calculator?.valueNumberDependent ?? 0)
		resultCalculation.total = totalSalaryWithoutDiscount - (discount + Double(resultCalculation.irrf ?? 0))
		
		return resultCalculation
	}
	
	public func porcentage(porcent: Double, of value: Double) -> Double {
		return value * porcent
	}
	
	public func calculateInss(salary: Double) -> Double {
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
					if indexMinSalary == 3 {
						resultInss = 908.85
						break
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
	
	public func calculateIrrf(salary: Double, discount: Double, numberDependent: Int) -> Double {
		let baseSalary = salary - discount - (Double(numberDependent) * 189.59)
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
					let descountAliquot = aliquots[indexCalculation]
					let descountDeduction = deductions[indexCalculation]
					descountIrrf = (baseSalary * descountAliquot) - descountDeduction
					break
				}
			}
		}
		return descountIrrf
	}
}
