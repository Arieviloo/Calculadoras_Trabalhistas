import Foundation

class RescissionViewModel {
	private(set) var calculator: Calculator?
	
	public func setCalculator(calculator: Calculator) { self.calculator = calculator }
	
	public func getTitle() -> String { calculator?.name ?? ""}
	
	public func stringFromDate(_ dateString: String ) -> Date  {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd/MM/yy"
		let date = dateFormatter.date(from: dateString) ?? Date()
		return date
	}
	
	public func setDateContratingdResignation(dateContrating: Date, dateResignation: Date) {
		calculator?.dateContracting = dateContrating
		calculator?.dateResignation = dateResignation
	}

}
