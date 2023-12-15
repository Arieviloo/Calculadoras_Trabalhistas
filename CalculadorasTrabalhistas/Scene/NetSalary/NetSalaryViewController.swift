import UIKit

class NetSalaryViewController: UIViewController {
	
	private let netSalaryView = NetSalaryView()
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		dump(calculator)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = netSalaryView
	}
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	
}
