
class ThirteenthViewModel {
	private(set) var calculator: Calculator?
	
	public func setCalculator(calculator: Calculator) { self.calculator = calculator }
	
	public func getTitle() -> String { calculator?.name ?? ""}
	
	public func setTypePayment(_ valueTypePayment: String) {
		calculator?.typePayment = valueTypePayment
	}
	
	public func setMonthWorked(_ valueMonthWorked: Int) {
		calculator?.monthWorked = valueMonthWorked
	}
}
