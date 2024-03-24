import Foundation

class RescissionResultViewModel {
	private(set) var calculator: Calculator?
	private var resultCalculation = ResultCalculation()
	private let calendar = Calendar.current
	
	public func setCalculator(calculator: Calculator) { self.calculator = calculator }
	
	public func resultRescission() -> ResultCalculation {
		guard let salary = calculator?.valueSalaryGross else { return resultCalculation }
		guard let dateContracting = calculator?.dateContracting else { return resultCalculation }
		guard let dateResignation = calculator?.dateResignation else { return resultCalculation }
		let additionalDangerouss = salary * (calculator?.valueAdditionalDangerousness ?? 0)
		let additionalInsalubrity = salary * (calculator?.valueLevelInsalubrity ?? 0)
		let grossSalary = salary + additionalDangerouss + additionalInsalubrity
		let valueSalaryForDay = grossSalary / 30
		var totalFGTS = 0.0
			
		let dateComponents = DateComponents(calendar: calendar)
		let contractingDate = calendar.dateComponents([.day, .month, .year], from: dateContracting)
		let resignationDate = calendar.dateComponents([.day, .month, .year], from: dateResignation)
		let timeInterval = calendar.dateComponents([.month], from: contractingDate, to: resignationDate)
		
		//Verbs rescission
		let balanceSalary = Double(resignationDate.day ?? 0) * valueSalaryForDay
		let vacationProportional = vacationProportional(grossSalary, dateContracting, dateResignation)
		let oneThirdVacation = vacationProportional / 3
		let thirteenthProportional = thirteenthProportional(grossSalary, dateResignation)
		//Discounts
		let inss = balanceSalary.calculateInss()
		let inssThirteenth = thirteenthProportional.calculateInss()
		let irrf = balanceSalary.calculateIrrf(discount: inss, numberDependent: calculator?.valueNumberDependent ?? 0)
		//FGTS
		let deposited = (grossSalary * 0.08) * Double(timeInterval.month ?? 0)
		let fgtsBalanceSalary = balanceSalary * 0.08
		let fgtsThirteenthProportional = thirteenthProportional * 0.08
		let fineFGTS = deposited * 0.4
		//result
		let totalVerbsRescission = balanceSalary + vacationProportional + oneThirdVacation + thirteenthProportional
		let totalDiscount = inss + inssThirteenth + irrf
		
		if calculator?.reasonResignation == "Dispensa sem justa causa" {
			totalFGTS = deposited + fgtsBalanceSalary + fgtsThirteenthProportional + fineFGTS
		}
		
		let valueNoticePeriod = getValueNoticePeriod(typeNoticePeriod: calculator?.noticePeriod ?? "", salary: grossSalary)
		
		resultCalculation.verbsRescission = totalVerbsRescission
		resultCalculation.discountsRescission = totalDiscount
		resultCalculation.totalFGTSRescission = totalFGTS
		resultCalculation.totalRescission = (totalVerbsRescission + totalFGTS + valueNoticePeriod.value) - totalDiscount
		resultCalculation.noticePeriod = valueNoticePeriod.value
		resultCalculation.noticePeriodColor = valueNoticePeriod.color
		
		dump(calculator)
		dump(valueNoticePeriod)
		print("-__-__-__-__-__-__-__-")
		print("-__-__-__-__-__-__-__-")
		print("-__-__-__-__-__-__-__-")
		
		print(grossSalary)
		print("-__-__-__-__-__-__-__-")
		print(balanceSalary)
		print(vacationProportional)
		print(oneThirdVacation)
		print(thirteenthProportional)
		print("-__-__-__-__-__-__-__-")
		print(inss)
		print(inssThirteenth)
		print(irrf)
		print("-__-__-__-__-__-__-__-")
		print(deposited)
		print(fgtsBalanceSalary)
		print(fgtsThirteenthProportional)
		print(fineFGTS)
		
		return resultCalculation
	}
	
	private func vacationProportional(_ salary: Double, _ dateContracting: Date, _ dateResignation: Date) -> Double {
		let monthContrating = calendar.component(.month, from: dateContracting)
		let monthResignation = calendar.component(.month, from: dateResignation)
		var monthWorked = 0
		
		if monthContrating > monthResignation {
			monthWorked = (12 - monthContrating) + monthResignation
		}
		
		if monthContrating < monthResignation {
			monthWorked = monthResignation - monthContrating
		}
		let valueVacationByMonth = salary / 12
		let vacationProportional = valueVacationByMonth * Double(monthWorked)
		
		return vacationProportional
	}
	
	private func thirteenthProportional(_ salary: Double, _ dateResignation: Date) -> Double {
		let salaryProportionalYear = salary / 12
		let monthResignation = calendar.component(.month, from: dateResignation)
		let thirteenthProportional = Double(monthResignation) * salaryProportionalYear
		
		return thirteenthProportional
	}
	
	private func getValueNoticePeriod(typeNoticePeriod: String, salary: Double) -> (value: Double, color: String){
		switch typeNoticePeriod {
		case "Indenizado pelo empregador":
			return (value: salary, color: "green")
		case "Não cumprido pelo empregado":
			return (value: -salary, color: "red")
		default:
			return (value: 0, color: "")
		}
	}

}
