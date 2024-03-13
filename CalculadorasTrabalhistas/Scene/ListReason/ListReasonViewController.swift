import UIKit

class ListReasonViewController: UIViewController {
	
	private var listReasonView = ListReasonView()
	
	override func loadView() {
		view = listReasonView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
