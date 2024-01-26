import Foundation

class AdditionalViewModel {
	
	private(set) var calculator: Calculator?
	
	public func setCalculator(calculator: Calculator) { self.calculator = calculator }
	
	public func setAdditional(
		isDangerousness: Bool,
		valueDangerousness: Double,
		isInsalubrity: Bool,
		valueLevelInsalubrity: Double) {
		
			self.calculator?.isAdditionalDangerousness = isDangerousness
			self.calculator?.isAdditionalInsalubrity = isInsalubrity
			self.calculator?.valueAdditionalDangerousness = valueDangerousness
			self.calculator?.valueLevelInsalubrity = valueLevelInsalubrity
	}
	
	public func getTitle() -> String { calculator?.name ?? ""}
	
	public func selectLevelInsalubrity(index: Int) -> Double {
		switch index {
		case 1 :
			return 0.20
		case 2 :
			return 0.40
		default :
			return 0.10
		}
	}
}
