
class VacationAccumulatedViewModel {
	private(set) var calculator: Calculator?
	
	public func setCalculator(calculator: Calculator) { self.calculator = calculator }
	
	public func getTitle() -> String { calculator?.name ?? ""}
	
	public func setVacationAccumulated(isAccumulated: Bool, quantityDay: Int) {
		calculator?.vacationAccumulated = isAccumulated
		calculator?.homManyDayVacationAccumulated = quantityDay
		
	}
	
}
