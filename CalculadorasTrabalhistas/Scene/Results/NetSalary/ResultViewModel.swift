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
	
}
