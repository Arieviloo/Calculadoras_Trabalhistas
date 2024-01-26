import UIKit

class AdditionalViewController: UIViewController {
	private let additionalView = AdditionalView()
	private var calculator: Calculator?
	private let additionalVM = AdditionalViewModel()
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		additionalVM.setCalculator(calculator: calculator)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = additionalView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configView()
	}
	
	private func configView() {
		title = additionalVM.getTitle()
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
		let isOnAdditionalDangerousness = additionalView.toggleDangerousnessSwitch.isOn
		let valueAdditionalDangerousness = isOnAdditionalDangerousness ? 0.30 : 0
		let isOnAdditionalInsalubrity = additionalView.toggleInsalubritySwitch.isOn
		let valueLevelInsalubrity = isOnAdditionalInsalubrity ? additionalVM.selectLevelInsalubrity(index: additionalView.btnSelect.selectedSegmentIndex) : 0
		
		additionalVM.setAdditional(
			isDangerousness: isOnAdditionalDangerousness,
			valueDangerousness: valueAdditionalDangerousness,
			isInsalubrity: isOnAdditionalInsalubrity,
			valueLevelInsalubrity: valueLevelInsalubrity
		)
		
		guard let calculator = additionalVM.calculator else { return }
		let next = getCalculatorViewController(calculator: calculator)
		navigationController?.pushViewController(next, animated: true)
	}
	

	
}
