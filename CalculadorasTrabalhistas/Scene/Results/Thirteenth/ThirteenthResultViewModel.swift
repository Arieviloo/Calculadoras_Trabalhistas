import UIKit

class ThirteenthResultViewModel {
	private(set) var calculator: Calculator?
	private var resultCalculation = ResultCalculation()
	
	public func setCalculator(calculator: Calculator) { self.calculator = calculator }
	
	public func calculateThirteenth() -> ResultCalculation {
		let salary = calculator?.valueSalaryGross ?? 0
		let numberDependent = calculator?.valueNumberDependent ?? 0
		let additionalDangerouss = (calculator?.valueAdditionalDangerousness ?? 0) * salary
		let additionalInsalubrity = (calculator?.valueLevelInsalubrity ?? 0) * salary
		let monthWorked = calculator?.monthWorked ?? 0
		let typePayment = calculator?.typePayment ?? ""
		
		let salaryTotal = salary + additionalDangerouss + additionalInsalubrity
		let thirtennthByMonth = salaryTotal / 12
		let valueMonthWorked = thirtennthByMonth * Double(monthWorked)
		let inss = valueMonthWorked.calculateInss()
		let irrf = valueMonthWorked.calculateIrrf(discount: inss, numberDependent: numberDependent)
		let halfThirteenth = valueMonthWorked / 2
		
		if typePayment == "Parcela única" {
			resultCalculation.salaryProportional = valueMonthWorked
			resultCalculation.inss = inss
			resultCalculation.irrf = irrf
			resultCalculation.total = valueMonthWorked - (inss + irrf)
		}
		
		if typePayment == "Primeira parcela" {
			resultCalculation.salaryProportional = halfThirteenth
			resultCalculation.inss = 0.0
			resultCalculation.irrf = 0.0
			resultCalculation.total = halfThirteenth
		}
		
		if typePayment == "Segunda parcela" {
			resultCalculation.salaryProportional = halfThirteenth
			resultCalculation.inss = inss
			resultCalculation.irrf = irrf
			resultCalculation.total = halfThirteenth - (inss + irrf)
		}
		
		resultCalculation.grossSalary = salary
		resultCalculation.additionalDangerouss = additionalDangerouss
		resultCalculation.additionalInsalubrity = additionalInsalubrity
		resultCalculation.monthWorked = monthWorked
		resultCalculation.typePayment = typePayment
		
		return resultCalculation
		
	}

}
