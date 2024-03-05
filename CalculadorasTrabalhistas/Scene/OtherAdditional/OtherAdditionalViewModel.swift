import UIKit

class OtherAdditionalViewModel {
	private(set) var calculator: Calculator?
	
	public func setCalculator(calculator: Calculator) { self.calculator = calculator }
	
	public func setOtherDiscountAndOtherAdditional(discount: Double, additional: Double) {
		calculator?.valueOtherDiscount = discount
		calculator?.valueOtherAdditional = additional
	}
		
	public func getTitle() -> String { calculator?.name ?? ""}
	
}
