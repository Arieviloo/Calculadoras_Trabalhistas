//
//  SalaryViewModelTests.swift
//  CalculadorasTrabalhistasTests
//
//  Created by Jadië Oliveira on 30/01/24.
//

import XCTest
@testable import CalculadorasTrabalhistas

final class SalaryViewModelTests: XCTestCase {
	private let sut = SalaryViewModel()
	private var calculatorDummy = Calculator(name: "Salário Líquido", icon: "icon-salariominimo", nameViewController: "NetSalaryViewController")
	
	func test_set_calculator() {
		sut.setCalculator(calculator: calculatorDummy)
		XCTAssertEqual(sut.getTitle(), "Salário Líquido")
	}
	
	func test_set_salary_and_dependent() {
		sut.setCalculator(calculator: calculatorDummy)
		sut.setSalaryAndDependent(salary: 2000.0, numberDependent: 1)
		XCTAssertEqual(sut.calculator?.valueSalaryGross, 2000.0)
		XCTAssertEqual(sut.calculator?.valueNumberDependent, 1)
	}
}
