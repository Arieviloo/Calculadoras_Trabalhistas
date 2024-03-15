import Foundation

class RescissionViewModel {
	private(set) var calculator: Calculator?
	
	public func setCalculator(calculator: Calculator) { self.calculator = calculator }
	
	public func getTitle() -> String { calculator?.name ?? ""}
	
	public func stringFromDate(_ dateString: String )  {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd/MM/yy"
		let test = dateFormatter.date(from: dateString)
	print("test -> \(test)")
		
	}

}
