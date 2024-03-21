import Foundation

class RescissionResultViewModel {
	private(set) var calculator: Calculator?
	private var resultCalculation = ResultCalculation()
	private let calendar = Calendar.current
	
	public func setCalculator(calculator: Calculator) { self.calculator = calculator }
	
	public func resultRescission() {
		guard let salary = calculator?.valueSalaryGross else { return }
		guard let dateContracting = calculator?.dateContracting else { return }
		guard let dateResignation = calculator?.dateResignation else { return }
		let valueSalaryForDay = salary / 30
		
		let dateComponents = DateComponents(calendar: calendar)
		let contractingDate = calendar.dateComponents([.day, .month, .year], from: dateContracting)
		let resignationDate = calendar.dateComponents([.day, .month, .year], from: dateResignation)
		let timeInterval = calendar.dateComponents([.month], from: contractingDate, to: resignationDate)
		
		//Verbs rescission
		let balanceSalary = Double(resignationDate.day ?? 0) * valueSalaryForDay
		let vacationProportional = vacationProportional(salary, dateContracting, dateResignation)
		let oneThirdVacation = vacationProportional / 3
		let thirteenthProportional = thirteenthProportional(salary, dateResignation)
		//Discounts
		let inss = balanceSalary.calculateInss()
		let inssThirteenth = thirteenthProportional.calculateInss()
		let irrf = balanceSalary.calculateIrrf(discount: inss, numberDependent: calculator?.valueNumberDependent ?? 0)
		//FGTS
		let deposited = (salary * 0.08) * Double(timeInterval.month ?? 0)
		let fgtsBalanceSalary = balanceSalary * 0.08
		let fgtsThirteenthProportional = thirteenthProportional * 0.08
		let fineFGTS = deposited * 0.4
				
		print(timeInterval)
		print("- - - - - - - - - - - - - - -")
		
		print(balanceSalary)
		print(vacationProportional)
		print(oneThirdVacation)
		print(thirteenthProportional)
		print("- - - - - - - - - - - - - - -")
		print(inss)
		print(inssThirteenth)
		print(irrf)
		print("- - - - - - - - - - - - - - -")
		print(deposited)
		print(fgtsBalanceSalary)
		print(fgtsThirteenthProportional)
		print(fineFGTS)
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

}


