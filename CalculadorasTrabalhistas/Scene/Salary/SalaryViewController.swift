import UIKit

class SalaryViewController: UIViewController {
	
	private let salaryView = SalaryView()
	private var calculator: Calculator?
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		self.calculator = calculator
		title = "\(calculator.name)"
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	override func loadView() {
		view = salaryView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.salaryView.configTextFieldDelegate(delegate: self)
		self.salaryView.delegate(delegate: self)
	}
	
}

extension SalaryViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}

extension SalaryViewController: SalaryViewProtocol {
	func tappedNext() {
		guard let calculator else { return }
		let additionalVC = AdditionalViewController(calculator: calculator)
		navigationController?.pushViewController(additionalVC, animated: true)
	}
	
	
}
