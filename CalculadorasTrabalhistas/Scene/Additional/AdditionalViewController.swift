import UIKit

class AdditionalViewController: UIViewController {
	private let additionalView = AdditionalView()
	private var calculator: Calculator?
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		self.calculator = calculator
		title = "\(calculator.name)"
		dump(calculator)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = additionalView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.additionalView.delegate(delegate: self)
	}
}


extension AdditionalViewController: AdditionalViewProtocol {
	func tappedAdditionalInsalubrity() {
		let toogle = additionalView.toggleInsalubritySwitch
		if toogle.isOn {
			additionalView.contentView.isHidden = false
		} else {
			additionalView.contentView.isHidden = true
		}
	}
	
	func tappedNext() {
		guard var calculator else { return }
		let isOnAdditionalDangerousness = additionalView.toggleDangerousnessSwitch.isOn
		let valueAdditionalDangerousness = isOnAdditionalDangerousness ? 0.30 : 0
		let isOnAdditionalInsalubrity = additionalView.toggleInsalubritySwitch.isOn
		let valueLevelInsalubrity = isOnAdditionalInsalubrity ? selectLevelInsalubrity(index: additionalView.btnSelect.selectedSegmentIndex) : 0
		
		calculator.isAdditionalDangerousness = isOnAdditionalDangerousness
		calculator.valueAditionalDangerousness = valueAdditionalDangerousness
		calculator.isAdditionalInsalubrity = isOnAdditionalInsalubrity
		calculator.valueLevelInsalubrity = valueLevelInsalubrity
		
		let next = getCalculatorViewController(calculator: calculator)
		navigationController?.pushViewController(next, animated: true)
	}
	
	func selectLevelInsalubrity(index: Int) -> Double {
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
