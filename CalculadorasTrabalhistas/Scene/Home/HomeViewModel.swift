import UIKit

class HomeViewModel {
	private let calculators: [Calculator] = [
		Calculator(name: "Salário Líquido", icon: "icon-salariominimo", nameViewController: "NetSalaryViewController"),
		Calculator(name: "Férias", icon: "icon-ferias"),
		Calculator(name: "Rescisão", icon: "icon-rescisao"),
		Calculator(name: "Décimo Terceiro", icon: "icon-decimoterceiro"),
	]
	
	public var getListCalculator: [Calculator] { calculators }
	
	public func numberOfItens() -> Int {
		return calculators.count
	}
	
}
