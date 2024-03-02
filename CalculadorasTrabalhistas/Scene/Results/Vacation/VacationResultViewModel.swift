import UIKit

class VacationResultViewModel {
	private(set) var calculator: Calculator?
	private var resultCalculation = ResultCalculation()
	
	public func setCalculator(calculator: Calculator) { self.calculator = calculator }
	
	private func calculateVacation() {
		let valueSalaryForDay = (calculator?.valueSalaryGross ?? 0) / 30
		let quantityDaysVacation = calculator?.amountVacationDay ?? 0
		let valueSalaryVacation = valueSalaryForDay * Double(quantityDaysVacation)
		let valueOneThirdVacation = valueSalaryVacation / 3
		let valueAllowancePecuniary = valueSalaryForDay * Double(calculator?.homManyDay ?? 0)
		let valueOneThirdAllowancePecuniary = valueAllowancePecuniary / 3
		let valueAdvanceFirstInstalmentThirteenth = (calculator?.valueSalaryGross ?? 0) / 2
		
		resultCalculation.salaryVacation = valueSalaryVacation
		resultCalculation.oneThirdVacation = valueOneThirdVacation
		resultCalculation.allowancePecuniary = valueAllowancePecuniary
		resultCalculation.oneThirdAllowancePecuniary = valueOneThirdAllowancePecuniary
		resultCalculation.advanceFirstInstalmentThirteenth = valueAdvanceFirstInstalmentThirteenth
		
	}
	
}
