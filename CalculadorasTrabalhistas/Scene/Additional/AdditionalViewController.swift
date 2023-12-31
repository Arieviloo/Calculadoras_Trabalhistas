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
		guard let calculator else { return }
		let next = getCalculatorViewController(calculator: calculator)
		navigationController?.pushViewController(next, animated: true)
//		if let  nextVC = "\(calculatorVC)".getViewController() {
//			nextVC.getCalculatorViewController(calculator: calculator)
//			navigationController?.pushViewController(nextVC, animated: true)
//		}
	}
	
	
}
