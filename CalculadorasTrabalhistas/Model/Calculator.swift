import Foundation

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
	
	var dateContracting: Date?
	var dateResignation: Date?
	var reasonResignation: String?
	var noticePeriod: String?
	var vacationAccumulated: Bool?
	var homManyDayVacationAccumulated: Int?
	
	var monthWorked: Int?
	var typePayment: String?
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
	
	var verbsRescission: Double?
	var discountsRescission: Double?
	var totalFGTSRescission: Double?
	var totalRescission: Double?
	var noticePeriod: Double?
	var noticePeriodColor: String?
	var accruedVacation: Double?

	var salaryProportional: Double?
	var monthWorked: Int?
	var typePayment: String?

}
