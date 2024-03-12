import XCTest
@testable import CalculadorasTrabalhistas

final class OtherAdditionalViewModelTests: XCTestCase {
	private let sut = OtherAdditionalViewModel()
	private var calculatorDummy = Calculator(name: "Salário Líquido", icon: "icon-salariominimo", nameViewController: "NetSalaryViewController")
	
	func test_set_calculator() {
		sut.setCalculator(calculator: calculatorDummy)
		XCTAssertEqual(sut.getTitle(), "Salário Líquido")
	}
	
	func test_set_other_discount_and_other_additional() {
		sut.setCalculator(calculator: calculatorDummy)
		sut.setOtherDiscountAndOtherAdditional(discount: 2000.0, additional: 200)
		XCTAssertEqual(sut.calculator?.valueOtherDiscount, 2000.0)
		XCTAssertEqual(sut.calculator?.valueOtherAdditional, 200)
	}
}
