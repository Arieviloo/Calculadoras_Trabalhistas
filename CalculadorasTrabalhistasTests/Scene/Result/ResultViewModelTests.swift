//
//  ResultViewModelTests.swift
//  CalculadorasTrabalhistasTests
//
//  Created by Jadië Oliveira on 30/01/24.
//

import XCTest
@testable import CalculadorasTrabalhistas

final class ResultViewModelTests: XCTestCase {
	
	private let sut = ResultViewModel()
	private var calculatorDummy = Calculator(name: "Salário Líquido",
											 icon: "icon-salariominimo",
											 nameViewController: "NetSalaryViewController",
											 valueSalaryGross: 3000.0,
											 valueNumberDependent: 1,
											 isAdditionalDangerousness: true,
											 valueAdditionalDangerousness: 0.3,
											 isAdditionalInsalubrity: true,
											 valueLevelInsalubrity: 0.2,
											 valueOtherDiscount: 400.0,
											 valueOtherAdditional: 600.0)
	
	
	func test_calculate_inss() {
		sut.setCalculator(calculator: calculatorDummy)
		let salaryGross = sut.calculator?.valueSalaryGross ?? 0
		let additionalDangerouss = sut.porcentage(porcent: sut.calculator?.valueAdditionalDangerousness ?? 0, of: sut.calculator?.valueSalaryGross ?? 0)
		let additionalInsalubrity = sut.porcentage(porcent: sut.calculator?.valueLevelInsalubrity ?? 0, of: sut.calculator?.valueSalaryGross ?? 0)
		let otherAdditional = sut.calculator?.valueOtherAdditional ?? 0
		let totalEarning = salaryGross + additionalDangerouss + additionalInsalubrity + otherAdditional
		
		let inss = totalEarning.calculateInss()
		XCTAssertEqual(inss, 532.819)
	}
	
	func test_calculate_irrf() {
		sut.setCalculator(calculator: calculatorDummy)
		let salaryGross = sut.calculator?.valueSalaryGross ?? 0
		let numberDependent = sut.calculator?.valueNumberDependent ?? 0
		let additionalDangerouss = sut.porcentage(porcent: sut.calculator?.valueAdditionalDangerousness ?? 0, of: sut.calculator?.valueSalaryGross ?? 0)
		let additionalInsalubrity = sut.porcentage(porcent: sut.calculator?.valueLevelInsalubrity ?? 0, of: sut.calculator?.valueSalaryGross ?? 0)
		let otherAdditional = sut.calculator?.valueOtherAdditional ?? 0
		let otherDiscount = sut.calculator?.valueOtherDiscount ?? 0
		let totalEarning = salaryGross + additionalDangerouss + additionalInsalubrity + otherAdditional
		let inss = totalEarning.calculateInss()
		let totalDiscounts = otherDiscount + inss
		
		let irrf = totalEarning.calculateIrrf(discount: totalDiscounts, numberDependent: numberDependent)
		XCTAssertEqual(irrf, 243.22797500000013)
	}
	
	func test_result_final() {
		sut.setCalculator(calculator: calculatorDummy)
		let salaryGross = sut.calculator?.valueSalaryGross ?? 0
		let numberDependent = sut.calculator?.valueNumberDependent ?? 0
		let additionalDangerouss = sut.porcentage(porcent: sut.calculator?.valueAdditionalDangerousness ?? 0, of: sut.calculator?.valueSalaryGross ?? 0)
		let additionalInsalubrity = sut.porcentage(porcent: sut.calculator?.valueLevelInsalubrity ?? 0, of: sut.calculator?.valueSalaryGross ?? 0)
		let otherAdditional = sut.calculator?.valueOtherAdditional ?? 0
		let otherDiscount = sut.calculator?.valueOtherDiscount ?? 0
		let totalEarning = salaryGross + additionalDangerouss + additionalInsalubrity + otherAdditional
		let inss = totalEarning.calculateInss()
		let totalDiscounts = otherDiscount + inss
		let irrf = totalEarning.calculateIrrf(discount: totalDiscounts, numberDependent: numberDependent)
		
		let result = totalEarning - (totalDiscounts + irrf)
		XCTAssertEqual(result, 3923.953025)
	}
	
	
}
