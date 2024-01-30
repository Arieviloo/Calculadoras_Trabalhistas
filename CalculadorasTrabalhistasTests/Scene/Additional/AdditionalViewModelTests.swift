//
//  AdditionalViewModelTests.swift
//  CalculadorasTrabalhistasTests
//
//  Created by Jadië Oliveira on 30/01/24.
//

import XCTest
@testable import CalculadorasTrabalhistas

final class AdditionalViewModelTests: XCTestCase {
	
	private let sut = AdditionalViewModel()
	private var calculatorDummy = Calculator(name: "Salário Líquido", icon: "icon-salariominimo", nameViewController: "NetSalaryViewController")
	
	func test_set_calculator() {
		sut.setCalculator(calculator: calculatorDummy)
		XCTAssertEqual(sut.getTitle(), "Salário Líquido")
	}
	
	func test_set_additional() {
		sut.setCalculator(calculator: calculatorDummy)
		sut.setAdditional(isDangerousness: false, valueDangerousness: 0.0, isInsalubrity: true, valueLevelInsalubrity: 2)
		XCTAssertEqual(sut.calculator?.isAdditionalDangerousness, false)
		XCTAssertEqual(sut.calculator?.valueAdditionalDangerousness, 0.0)
		XCTAssertEqual(sut.calculator?.isAdditionalInsalubrity, true)
		XCTAssertEqual(sut.calculator?.valueLevelInsalubrity, 2)
	}
	
	func test_select_level_insalubrity() {
		sut.setCalculator(calculator: calculatorDummy)
		let levelInsalubrity = sut.selectLevelInsalubrity(index: 2)
		XCTAssertEqual(levelInsalubrity, 0.40)
	}
}
