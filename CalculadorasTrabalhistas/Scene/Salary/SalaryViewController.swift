import UIKit

class SalaryViewController: UIViewController {
	
	private let salaryView = SalaryView()
	
	override func loadView() {
		view = salaryView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
