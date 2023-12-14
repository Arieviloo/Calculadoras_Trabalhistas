import UIKit

class NetSalaryViewController: UIViewController {
	
	private let netSalaryView = NetSalaryView()
	
	override func loadView() {
		view = netSalaryView
	}
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
