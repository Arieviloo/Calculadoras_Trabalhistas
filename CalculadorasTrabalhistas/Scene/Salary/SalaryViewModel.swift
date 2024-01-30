import UIKit

class SalaryViewModel {
	
	private(set) var calculator: Calculator?
	
	public func setCalculator(calculator: Calculator) { self.calculator = calculator }
	
	public func setSalaryAndDependent(salary: Double, numberDependent: Int) {
		calculator?.valueSalaryGross = salary
		calculator?.valueNumberDependent = numberDependent
	}
		
	public func getTitle() -> String { calculator?.name ?? ""}
	
}
