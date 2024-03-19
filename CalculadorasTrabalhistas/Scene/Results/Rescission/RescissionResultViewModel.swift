
class RescissionResultViewModel {
	private(set) var calculator: Calculator?
	private var resultCalculation = ResultCalculation()
	
	public func setCalculator(calculator: Calculator) { self.calculator = calculator }
}
