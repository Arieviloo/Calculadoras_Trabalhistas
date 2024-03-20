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
		
		
		let balanceSalary = Double(resignationDate.day ?? 0) * valueSalaryForDay
		let vacationProportional = vacationProportional(salary, dateContracting, dateResignation)
		let oneThirdVacation = vacationProportional / 3
		let thirteenthProportional = thirteenthProportional(salary, dateResignation)
		
		print(balanceSalary)
		print(vacationProportional)
		print(oneThirdVacation)
		print(thirteenthProportional)
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


