import UIKit

class SalaryViewController: UIViewController {
	
	private let salaryView = SalaryView()
	
	init(name: String) {
		super.init(nibName: nil, bundle: nil)
		title = "\(name)"
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
		let additionalVC = AdditionalViewController()
		navigationController?.pushViewController(additionalVC, animated: true)
	}
	
	
}
