import UIKit

class VacationResultViewController: UIViewController {
	private let resultView = VacationResultView()
	
	override func loadView() {
		view = resultView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = String(localizedKey: "result")
	}
	
}
