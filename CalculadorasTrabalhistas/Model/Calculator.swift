struct Calculator {
	var name: String
	var icon: String
	var nameViewController: String?
	var valueSalaryGross: Double?
	var valueNumberDependent: Int?
	var isAdditionalDangerousness: Bool?
	var valueAdditionalDangerousness: Double?
	var isAdditionalInsalubrity: Bool?
	var valueLevelInsalubrity: Double?
	var valueOtherDiscount: Double?
	var valueOtherAdditional: Double?
	
	var amountVacationDay: Int?
	var willAntecipateThirteenth: Bool?
	var willSellVacation: Bool?
	var homManyDay: Int?
}

struct ResultCalculation {
	var grossSalary: Double?
	var additionalDangerouss: Double?
	var additionalInsalubrity: Double?
	var otherDiscount: Double?
	var otherAdditional: Double?
	var inss: Double?
	var irrf: Double?
	var total: Double?
	
	var salaryVacation: Double?
	var oneThirdVacation: Double?
	var allowancePecuniary: Double?
	var oneThirdAllowancePecuniary: Double?
	var advanceFirstInstalmentThirteenth: Double?
}
