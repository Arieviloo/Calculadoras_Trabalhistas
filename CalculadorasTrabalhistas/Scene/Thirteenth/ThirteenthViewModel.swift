
class ThirteenthViewModel {
	private(set) var calculator: Calculator?
	
	public func setCalculator(calculator: Calculator) { self.calculator = calculator }
	
	public func getTitle() -> String { calculator?.name ?? ""}
	
	public func setTypePayment(_ type: String) {
		calculator?.typePayment = type
	}
}
