import UIKit

class VacationViewController: UIViewController {
	private let vacationView = VacationView()
	
	override func loadView() {
		view = vacationView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
