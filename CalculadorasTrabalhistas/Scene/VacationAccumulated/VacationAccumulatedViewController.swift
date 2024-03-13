import UIKit

class VacationAccumulatedViewController: UIViewController {
	
	private let vacationAccumulatedView = VacationAccumulatedView()
	
	override func loadView() {
		view = vacationAccumulatedView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
