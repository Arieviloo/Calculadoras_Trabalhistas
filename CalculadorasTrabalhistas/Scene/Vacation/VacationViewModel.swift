class VacationViewModel {
	private(set) var calculator: Calculator?
	
	public func setCalculator(calculator: Calculator) { self.calculator = calculator }
	
	public func getTitle() -> String { calculator?.name ?? ""}
	
	public func setDayVacation(amountDay: Int, isThirteenth: Bool, isSell: Bool, homManyDay: Int) {
		calculator?.amountVacationDay = amountDay
		calculator?.willAntecipateThirteenth = isThirteenth
		calculator?.willSellVacation = isSell
		calculator?.homManyDay = homManyDay
	}
}
