import UIKit

class ResultViewController: UIViewController {
	private let resultView = ResultView()
	
	override func loadView() {
		view = resultView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = String(localizedKey: "result")
	}
}
