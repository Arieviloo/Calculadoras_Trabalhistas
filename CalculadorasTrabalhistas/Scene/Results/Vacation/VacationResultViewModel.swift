import UIKit

class VacationResultViewModel {
	private(set) var calculator: Calculator?
	private var resultCalculation = ResultCalculation()
	
	public func setCalculator(calculator: Calculator) { self.calculator = calculator }
	
	func calculateVacation() -> ResultCalculation {
		let valueSalaryForDay = (calculator?.valueSalaryGross ?? 0) / 30
		let quantityDaysVacation = calculator?.amountVacationDay ?? 0
		let valueSalaryVacation = valueSalaryForDay * Double(quantityDaysVacation)
		let valueOneThirdVacation = valueSalaryVacation / 3
		let valueAllowancePecuniary = valueSalaryForDay * Double(calculator?.homManyDay ?? 0)
		let valueOneThirdAllowancePecuniary = valueAllowancePecuniary / 3
		let valueAdvanceFirstInstalmentThirteenth = (calculator?.valueSalaryGross ?? 0) / 2
		
		
		
		resultCalculation.grossSalary = calculator?.valueSalaryGross
		resultCalculation.additionalDangerouss = porcentage(porcent: calculator?.valueAdditionalDangerousness ?? 0, of: resultCalculation.grossSalary ?? 0)
		resultCalculation.additionalInsalubrity = porcentage(porcent: calculator?.valueLevelInsalubrity ?? 0, of: resultCalculation.grossSalary ?? 0)
		resultCalculation.otherDiscount = calculator?.valueOtherDiscount ?? 0
		resultCalculation.otherAdditional = calculator?.valueOtherAdditional ?? 0
		
		resultCalculation.salaryVacation = valueSalaryVacation
		resultCalculation.oneThirdVacation = valueOneThirdVacation
		resultCalculation.allowancePecuniary = valueAllowancePecuniary
		resultCalculation.oneThirdAllowancePecuniary = valueOneThirdAllowancePecuniary
		resultCalculation.advanceFirstInstalmentThirteenth = valueAdvanceFirstInstalmentThirteenth
		
		dump(resultCalculation)
		
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
