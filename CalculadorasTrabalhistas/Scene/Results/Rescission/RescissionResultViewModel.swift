import Foundation

class RescissionResultViewModel {
	private(set) var calculator: Calculator?
	private var resultCalculation = ResultCalculation()
	
	public func setCalculator(calculator: Calculator) { self.calculator = calculator }
	
	public func resultRescission() {
		guard let dateContracting = calculator?.dateContracting else { return }
		guard let dateResignation = calculator?.dateResignation else { return }
		let valueSalaryForDay = (calculator?.valueSalaryGross ?? 0) / 30
		
		
		let calendar = Calendar.current
		let dateComponents = DateComponents(calendar: calendar)
		let composedDate = calendar.date(from: dateComponents)
		let contractingDate = calendar.dateComponents([.day, .month, .year], from: dateContracting)
		let resignationDate = calendar.dateComponents([.day, .month, .year], from: dateResignation)
		
		
		let monthContrating = calendar.component(.month, from: dateContracting)
		let monthResignation = calendar.component(.month, from: dateResignation)
		var monthDifferences = 0
		
		if monthContrating > monthResignation {
			monthDifferences = (12 - monthContrating) + monthResignation
		}
		
		if monthContrating < monthResignation {
			monthDifferences = monthResignation - monthContrating
		}
		
		let balanceSalary = Double(resignationDate.day ?? 0) * valueSalaryForDay
		let vacationProportional = vacationProportional(calculator?.valueSalaryGross ?? 0, monthDifferences)
		let oneThirdVacation = vacationProportional / 3
		
		
		print(vacationProportional)
	}
	
	private func vacationProportional(_ salary: Double, _ monthWorked: Int) -> Double {
		let valueVacationByMonth = salary / 12
		let vacationProportional = valueVacationByMonth * Double(monthWorked)
		
		return vacationProportional
	}

}


