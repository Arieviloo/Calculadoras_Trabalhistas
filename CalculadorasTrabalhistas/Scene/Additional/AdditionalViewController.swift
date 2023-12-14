import UIKit

class AdditionalViewController: UIViewController {
	private let additionalView = AdditionalView()
	private var calculator: Calculator?
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		self.calculator = calculator
		title = "\(calculator.name)"
		print(calculator)
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
		guard let calculatorVC = calculator?.nameViewController else { return }
		if let  nextVC = "\(calculatorVC)".getViewController() {
			navigationController?.pushViewController(nextVC, animated: true)
		}
	}
	
	
}
