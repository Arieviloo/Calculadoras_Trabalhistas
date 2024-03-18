class ListReasonViewModel {
	private(set) var calculator: Calculator?
	
	public func setCalculator(calculator: Calculator) { self.calculator = calculator }
	
	public func getTitle() -> String { calculator?.name ?? ""}
	
	public func setReasonResignation(reason: String) {
		calculator?.reasonResignation = reason
	}

}
