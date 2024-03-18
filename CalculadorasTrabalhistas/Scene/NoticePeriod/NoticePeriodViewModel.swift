
class NoticePeriodViewModel {
	private(set) var calculator: Calculator?
	
	public func setCalculator(calculator: Calculator) { self.calculator = calculator }
	
	public func getTitle() -> String { calculator?.name ?? ""}
	
	public func setNoticePeriod(noticePeriod: String) {
		calculator?.noticePeriod = noticePeriod
	}

}
